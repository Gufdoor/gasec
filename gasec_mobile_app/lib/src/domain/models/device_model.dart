import 'package:gasec_mobile_app/src/domain/enums/environment_setting_enum.dart';
import 'package:gasec_mobile_app/src/domain/enums/leakage_status_enum.dart';

class DeviceModel {
  late String ip;
  late double gasConcentration;
  late EnvironmentSettingEnum environment;
  late LeakageStatusEnum leakage;

  DeviceModel({
    this.ip = "N/A",
    this.gasConcentration = 0.0,
    this.environment = EnvironmentSettingEnum.indoor,
    this.leakage = LeakageStatusEnum.processing,
  });
}
