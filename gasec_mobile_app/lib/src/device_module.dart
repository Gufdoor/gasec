import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/device/bloc/device_cubit.dart";
import "package:gasec_mobile_app/src/modules/device/device_page.dart";

const String routeDevice = "/device/device";

class DeviceModule extends Module {
  final String _device = "/device";

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => DeviceCubit()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(_device, child: (_, __) => const DevicePage()),
      ];
}
