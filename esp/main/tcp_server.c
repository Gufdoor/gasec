#include "esp_adc/adc_cali.h"
#include "esp_adc/adc_cali_scheme.h"
#include "esp_adc/adc_oneshot.h"
#include "esp_err.h"
#include "esp_event.h"
#include "esp_log.h"
#include "esp_netif.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "freertos/FreeRTOS.h"
#include "freertos/projdefs.h"
#include "freertos/task.h"
#include "hal/adc_types.h"
#include "hal/gpio_types.h"
#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "nvs_flash.h"
#include "protocol_examples_common.h"
#include "stdatomic.h"
#include <driver/gpio.h>
#include <lwip/netdb.h>
#include <string.h>
#include <sys/param.h>

#define PORT CONFIG_EXAMPLE_PORT
#define KEEPALIVE_IDLE CONFIG_EXAMPLE_KEEPALIVE_IDLE
#define KEEPALIVE_INTERVAL CONFIG_EXAMPLE_KEEPALIVE_INTERVAL
#define KEEPALIVE_COUNT CONFIG_EXAMPLE_KEEPALIVE_COUNT
#define MQ2_DO_PIN GPIO_NUM_13
#define MAIN_TASK_DELAY_MS 1000

static const char *SOCKET_TAG = "SOCKET";
static const char *MQ2_TAG = "MQ2";
static atomic_bool isConnected = false;

static void transmit_sample(const int sock, QueueHandle_t sampleQueue) {
  while (true) {
    int sample;

    // If there's nothing to send, skip
    if (xQueueReceive(sampleQueue, &sample, 10 / portTICK_PERIOD_MS) !=
        pdTRUE) {
      continue;
    }

    ESP_LOGI(SOCKET_TAG, "Sending: %d", sample);
    int written = send(sock, &sample, sizeof(sample), 0);

    // Failed to retransmit, giving up
    if (written < 0) {
      ESP_LOGE(SOCKET_TAG, "Error occurred during sending: errno %d", errno);
      return;
    }
  }
}

static void tcp_server_task(void *pvParameters) {
  char addr_str[128];
  int addr_family = AF_INET;
  int ip_protocol = 0;
  int keepAlive = 1;
  int keepIdle = KEEPALIVE_IDLE;
  int keepInterval = KEEPALIVE_INTERVAL;
  int keepCount = KEEPALIVE_COUNT;
  struct sockaddr_storage dest_addr;

  QueueHandle_t sampleQueue = pvParameters;

#ifdef CONFIG_EXAMPLE_IPV4
  struct sockaddr_in *dest_addr_ip4 = (struct sockaddr_in *)&dest_addr;
  dest_addr_ip4->sin_addr.s_addr = htonl(INADDR_ANY);
  dest_addr_ip4->sin_family = AF_INET;
  dest_addr_ip4->sin_port = htons(PORT);
  ip_protocol = IPPROTO_IP;
#endif

  int listen_sock = socket(addr_family, SOCK_STREAM, ip_protocol);

  if (listen_sock < 0) {
    ESP_LOGE(SOCKET_TAG, "Unable to create socket: errno %d", errno);
    vTaskDelete(NULL);
    return;
  }

  int opt = 1;
  setsockopt(listen_sock, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));

  ESP_LOGI(SOCKET_TAG, "Socket created");

  int err = bind(listen_sock, (struct sockaddr *)&dest_addr, sizeof(dest_addr));

  if (err != 0) {
    ESP_LOGE(SOCKET_TAG, "Socket unable to bind: errno %d", errno);
    ESP_LOGE(SOCKET_TAG, "IPPROTO: %d", addr_family);
    goto CLEAN_UP;
  }

  ESP_LOGI(SOCKET_TAG, "Socket bound, port %d", PORT);

  err = listen(listen_sock, 1);

  if (err != 0) {
    ESP_LOGE(SOCKET_TAG, "Error occurred during listen: errno %d", errno);
    goto CLEAN_UP;
  }

  while (1) {

    ESP_LOGI(SOCKET_TAG, "Socket listening...");

    struct sockaddr_storage source_addr; // Large enough for IPv4
    socklen_t addr_len = sizeof(source_addr);
    int sock = accept(listen_sock, (struct sockaddr *)&source_addr, &addr_len);

    if (sock < 0) {
      ESP_LOGE(SOCKET_TAG, "Unable to accept connection: errno %d", errno);
      break;
    }

    // Set tcp keepalive option
    setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE, &keepAlive, sizeof(int));
    setsockopt(sock, IPPROTO_TCP, TCP_KEEPIDLE, &keepIdle, sizeof(int));
    setsockopt(sock, IPPROTO_TCP, TCP_KEEPINTVL, &keepInterval, sizeof(int));
    setsockopt(sock, IPPROTO_TCP, TCP_KEEPCNT, &keepCount, sizeof(int));

    // Convert ip address to string
#ifdef CONFIG_EXAMPLE_IPV4
    if (source_addr.ss_family == PF_INET) {
      inet_ntoa_r(((struct sockaddr_in *)&source_addr)->sin_addr, addr_str,
                  sizeof(addr_str) - 1);
    }
#endif

    ESP_LOGI(SOCKET_TAG, "Socket accepted ip address: %s", addr_str);

    isConnected = true;
    transmit_sample(sock, sampleQueue);
    isConnected = false;

    shutdown(sock, 0);
    close(sock);
  }

CLEAN_UP:
  close(listen_sock);
  vTaskDelete(NULL);
}

void app_main(void) {
  ESP_ERROR_CHECK(nvs_flash_init());
  ESP_ERROR_CHECK(esp_netif_init());
  ESP_ERROR_CHECK(esp_event_loop_create_default());

  gpio_config_t conf = {
      .intr_type = GPIO_INTR_DISABLE,
      .mode = GPIO_MODE_INPUT,
      .pull_up_en = GPIO_PULLUP_DISABLE,
      .pull_down_en = GPIO_PULLDOWN_DISABLE,
      .pin_bit_mask = 1 << MQ2_DO_PIN,
  };

  esp_err_t err = gpio_config(&conf);

  if (err != ESP_OK) {
    ESP_LOGE(MQ2_TAG, "gpio_config PIN 13 FAILED: %s", esp_err_to_name(err));
  }

  adc_oneshot_unit_init_cfg_t initConfig = {.unit_id = ADC_UNIT_1,
                                            .ulp_mode = ADC_ULP_MODE_DISABLE};
  adc_oneshot_chan_cfg_t config = {.atten = ADC_ATTEN_DB_0,
                                   .bitwidth = ADC_BITWIDTH_DEFAULT};
  adc_oneshot_unit_handle_t adcHandle;
  adc_cali_handle_t adcCalibrationHandle;

  err = adc_oneshot_new_unit(&initConfig, &adcHandle);

  if (err != ESP_OK) {
    ESP_LOGE(MQ2_TAG, "adc_oneshot_new_unit FAILED: %s", esp_err_to_name(err));
  }

  err = adc_oneshot_config_channel(adcHandle, ADC_CHANNEL_5, &config);

  if (err != ESP_OK) {
    ESP_LOGE(MQ2_TAG, "adc_oneshot_config_channel FAILED: %s",
             esp_err_to_name(err));
  }

  adc_cali_line_fitting_config_t cali_config = {
      .unit_id = ADC_UNIT_1,
      .atten = ADC_ATTEN_DB_0,
      .bitwidth = ADC_BITWIDTH_DEFAULT,
  };

  err =
      adc_cali_create_scheme_line_fitting(&cali_config, &adcCalibrationHandle);

  if (err != ESP_OK) {
    ESP_LOGE(MQ2_TAG, "adc_cali_create_scheme_curve_fitting FAILED: %s",
             esp_err_to_name(err));
  }

  /* This helper function configures Wi-Fi or Ethernet, as selected in
   * menuconfig. Read "Establishing Wi-Fi or Ethernet Connection" section in
   * examples/protocols/README.md for more information about this function.
   */
  ESP_ERROR_CHECK(example_connect());

  QueueHandle_t sampleQueue = xQueueCreate(10, sizeof(int));

  if (!sampleQueue) {
    ESP_LOGE(SOCKET_TAG, "FATAL ERROR! sampleQueue wasn't initialized.");
    return;
  }

#ifdef CONFIG_EXAMPLE_IPV4
  xTaskCreate(tcp_server_task, "tcp_server", 4096, sampleQueue, 5, NULL);
#endif

  /* Loop for reading analog output with a delay determined by
   * MAIN_TASK_DELAY_MS and portTICK_PERIOD_MS. For each iteration,
   * a raw sample value is generated, added to a queue and sent to connected
   * devices using sockets.
   */
  while (true) {
    vTaskDelay(MAIN_TASK_DELAY_MS / portTICK_PERIOD_MS);

    int rawSample;
    err = adc_oneshot_read(adcHandle, ADC_CHANNEL_5, &rawSample);

    if (err != ESP_OK) {
      ESP_LOGE(MQ2_TAG, "adc_oneshot_read FAILED: %s", esp_err_to_name(err));
      continue;
    }

    // TODO: calibratedSample isn't being used since it doesn't show any
    // improvments now
    // int calibratedSample;
    // err = adc_cali_raw_to_voltage(adcCalibrationHandle, rawSample,
    //                               &calibratedSample);
    //
    // if (err != ESP_OK) {
    //   ESP_LOGE(MQ2_TAG, "adc_cali_raw_to_voltage FAILED %s",
    //            esp_err_to_name(err));
    //   continue;
    // }

    ESP_LOGI(MQ2_TAG, "%i - %f", rawSample, rawSample * (2.5f / 4096));

    if (!isConnected) {
      continue;
    }

    if (xQueueSend(sampleQueue, &rawSample, 0) == errQUEUE_FULL) {
      ESP_LOGE(SOCKET_TAG, "QUEUE FULL!");
    }
  }
}
