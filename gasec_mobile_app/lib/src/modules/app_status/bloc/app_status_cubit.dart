import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/app_wrap_cubit.dart";
import "package:gasec_mobile_app/src/core/services/connection_service.dart";
import "package:gasec_mobile_app/src/modules/app_status/bloc/app_status_state.dart";

class AppStatusCubit extends Cubit<AppStatusState> {
  AppStatusCubit() : super(const AppStatusState()) {
    _init();
  }

  void _init() async {
    print("init AppStatusCubit ${Modular.to.path}");
    AppWrapCubit.init();
    ConnectionService.init();
  }
}
