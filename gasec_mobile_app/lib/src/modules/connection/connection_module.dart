import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/connection/bloc/connection_cubit.dart";
import "package:gasec_mobile_app/src/modules/connection/connect/connect_page.dart";

const String routeConnect = "/connection/connect";

class ConnectionModule extends Module {
  final String _connect = "/connect";

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ConnectionCubit()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(_connect, child: (_, __) => const ConnectPage()),
      ];
}
