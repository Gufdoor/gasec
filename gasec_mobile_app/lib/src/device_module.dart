import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/device/device_page.dart";

const String routeDevice = "/app/device";

class DeviceModule extends Module {
  final String _device = "/device";

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(_device, child: (_, __) => const DevicePage()),
      ];
}
