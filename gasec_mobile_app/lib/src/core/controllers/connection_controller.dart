import "dart:async";
import "dart:io";
import "dart:typed_data";

import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/gasec/gasec_module.dart";

class ConnectionController implements Disposable {
  ConnectionController._internal();

  static final ConnectionController _instance =
      ConnectionController._internal();

  static ConnectionController get instance => _instance;

  static bool _hasInit = false;

  static void init() {
    if (!_hasInit) {
      _hasInit = true;
      _instance._init();
    }
  }

  late Socket socket;
  final List<int> concentrations = [];

  final StreamController<double> _concentrationController =
      StreamController<double>.broadcast();

  Stream<double> get streamConcentration => _concentrationController.stream;

  @override
  void dispose() {}

  Future<bool> connect(String ip) async {
    try {
      socket = await Socket.connect(ip, 3333);
      _listenSocketData();
    } catch (e) {
      return false;
    }

    return true;
  }

  void disconnect() => socket.destroy();

  void _init() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Modular.to.navigate(routeConnect);
    });
  }

  void _listenSocketData() async {
    late Uint8List bytes;
    late int value;

    socket.listen((data) {
      bytes = Uint8List.fromList(data);
      value = ByteData.sublistView(bytes).getInt32(0, Endian.little);
      _processConcentrations(value);
    });
  }

  void _processConcentrations(int concentration) {
    if (concentrations.length < 10) {
      concentrations.add(concentration);
    } else {
      late int sum = 0;

      for (final concentration in concentrations) {
        sum += concentration;
      }

      final double average = sum / concentrations.length;
      concentrations.clear();

      _handleConcentrationCallback(average);
    }
  }

  void _handleConcentrationCallback(double concentration) =>
      _concentrationController.sink.add(concentration);
}
