import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/app_wrap_cubit.dart";
import "package:gasec_mobile_app/src/core/services/connection_service.dart";
import "package:gasec_mobile_app/src/domain/models/device_model.dart";
import "package:gasec_mobile_app/src/modules/gasec/bloc/gasec_state.dart";
import "package:gasec_mobile_app/src/modules/gasec/gasec_module.dart";

class GasecCubit extends Cubit<GasecState> implements Disposable {
  GasecCubit() : super(const GasecState()) {
    _init();
  }

  final ConnectionService _connectionService = ConnectionService.instance;
  late DeviceModel _device = DeviceModel();

  @override
  void dispose() {
    _device = DeviceModel();
  }

  void connectDevice(String ip) async {
    AppWrapCubit.instance.initLoading(message: "Carregando.");
    print(ip);
    // if () {
    //   mockLogin(email);
    //   AppWrapCubit.instance.finishLoading();
    //   return;
    // }

    await _connectionService.connect();

    Modular.to.navigate(routeDevice);
    AppWrapCubit.instance.finishLoading();
    _update();
  }

  void _init() async {
    AppWrapCubit.init();
    ConnectionService.init();
  }

  void _update() {
    emit(state.copyWith(status: GasecStatus.initial, device: _device));
  }
}
