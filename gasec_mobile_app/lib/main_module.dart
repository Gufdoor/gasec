import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/device_module.dart";
import "package:gasec_mobile_app/src/app_wrap_page.dart";
import "package:gasec_mobile_app/src/modules/connection/connection_module.dart";

class MainModule extends Module {
  final String _connection = "/connection";
  final String _device = "/device";

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const AppWrapPage(),
          transition: TransitionType.noTransition,
          children: [
            ModuleRoute(_connection, module: ConnectionModule()),
            ModuleRoute(_device, module: DeviceModule()),
          ],
        )
      ];
}
