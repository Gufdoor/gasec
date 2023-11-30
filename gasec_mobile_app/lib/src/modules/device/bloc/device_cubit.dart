import "package:flutter_bloc/flutter_bloc.dart";
import "package:gasec_mobile_app/src/app_wrap_cubit.dart";
import "package:gasec_mobile_app/src/core/services/connection_service.dart";
import "package:gasec_mobile_app/src/modules/connection/bloc/connection_state.dart";

class DeviceCubit extends Cubit<ConnectionState> {
  DeviceCubit() : super(const ConnectionState()) {
    print(">> DeviceCubit");
  }

  final ConnectionService _connectionService = ConnectionService.instance;

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
