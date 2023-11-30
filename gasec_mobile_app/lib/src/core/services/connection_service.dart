import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/connection/connection_module.dart";

class ConnectionService {
  ConnectionService._internal();

  static final ConnectionService _instance = ConnectionService._internal();

  static ConnectionService get instance => _instance;

  static bool _hasInit = false;

  static void init() {
    if (!_hasInit) {
      _hasInit = true;
      _instance._init();
    }
  }

  Future<(int, String)> connect() async {
    return (0, "conectando");
  }

  void disconnect() {
    // _user = UserModel();
    Modular.to.navigate(routeConnect);
    // MedicService.instance.reset();
  }

  void _init() {
    print("initing connection");
    Future.delayed(const Duration(milliseconds: 3000), () {
      Modular.to.navigate(routeConnect);
    });
  }
}
