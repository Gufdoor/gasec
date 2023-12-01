import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/app_wrap_page.dart";
import "package:gasec_mobile_app/src/modules/gasec/gasec_module.dart";

class MainModule extends Module {
  final String _connection = "/connection";

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const AppWrapPage(),
          transition: TransitionType.noTransition,
          children: [
            ModuleRoute(_connection, module: GasecModule()),
          ],
        )
      ];
}
