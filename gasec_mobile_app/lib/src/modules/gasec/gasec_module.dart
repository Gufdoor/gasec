import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/gasec/bloc/gasec_cubit.dart";
import "package:gasec_mobile_app/src/modules/gasec/connect/connect_page.dart";
import "package:gasec_mobile_app/src/modules/gasec/device/device_page.dart";

const String routeConnect = "/connection/connect";
const String routeDevice = "/connection/device";

class GasecModule extends Module {
  final String _connect = "/connect";
  final String _device = "/device";

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => GasecCubit()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(_connect, child: (_, __) => const ConnectPage()),
        ChildRoute(_device, child: (_, __) => const DevicePage()),
      ];
}
