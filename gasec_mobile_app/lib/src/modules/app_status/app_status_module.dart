import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/app_status/loading/app_status_loading_page.dart";

List<Bind> get binds => [];

const String routeAppLoading = "/status/loading";

class AppStatusModule extends Module {
  final String _loading = "/loading";

  @override
  List<ModularRoute> get routes => [
        ChildRoute(_loading, child: (_, __) => const AppStatusLoadingPage()),
      ];
}
