import "package:flutter_bloc/flutter_bloc.dart";
import "package:gasec_mobile_app/src/app_wrap_cubit.dart";
import "package:gasec_mobile_app/src/core/services/connection_service.dart";
import "package:gasec_mobile_app/src/modules/connection/bloc/connection_state.dart";

class ConnectionCubit extends Cubit<ConnectionState> {
  ConnectionCubit() : super(const ConnectionState()) {
    _init();
  }

  void _init() async {
    AppWrapCubit.init();
    ConnectionService.init();
  }

  final ConnectionService _connectionService = ConnectionService.instance;

  void dispose() {}

  void connectDevice() async {
    AppWrapCubit.instance.initLoading(message: "Carregando.");
    // if () {
    //   mockLogin(email);
    //   AppWrapCubit.instance.finishLoading();
    //   return;
    // }

    await _connectionService.connect();
    AppWrapCubit.instance.finishLoading();
    _update();
  }

  void _update() {
    emit(state.copyWith(status: ConnectStatus.initial));
  }
}
