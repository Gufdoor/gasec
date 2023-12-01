# Gasec: A Simple Gas Detector System

## This project aims to

This project aims to provide quick and simple inflamable gases concentration readings, and also an intuitive user feedback. 'Tis a plug & play system: turn hardware on and connect.

## Hardware components

- 1x MQ-2 sensor
- 1x ESP32 devkit V1
- 1x protoboard
- 2x 4 band resistors: brown, black, orange, gold
- 5x male-to-male jumpers

## How to use 

For ESP, you'll need to have ESP IDF installed. Here's Espressif official doc: https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/windows-setup.html
If you have an ESP and IDF already installed, you manage and compile this code with the following standard commands (note: you need to open IDF terminal and set directory path to ESP root project folder):
- Configure the project to your own parameters (such as WIFI): `idf.py menuconfig`
- Compile project: `idf.py build`
- Monitor ESP: `idf.py -p PORT monitor`
- After compiling, if small changes were made on the code: `idf.py -p PORT flash monitor`

For Android app, you'll need to install Flutter required tools for development. Here's Flutter official doc: https://docs.flutter.dev/get-started/install

ESP is the TCP server and send updated data to Android app using sockets. You can find 'tis ip and port while running monitor, also 'tis not guaranteed that this IP is static. Furthermore, you need to set both ESP and app on the same network. 
