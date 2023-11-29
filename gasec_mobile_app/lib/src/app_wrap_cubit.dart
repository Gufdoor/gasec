import "dart:async";
import "dart:math";

import "package:flutter_bloc/flutter_bloc.dart";
import "package:gasec_mobile_app/src/app_wrap_state.dart";

class AppWrapCubit extends Cubit<AppWrapState> {
  AppWrapCubit._internal() : super(const AppWrapState());

  static final AppWrapCubit _instance = AppWrapCubit._internal();

  static AppWrapCubit get instance => _instance;

  static bool _hasInit = false;
  static bool _isLoading = false;
  late String loadingMessage = "";

  static void init() {
    if (!_hasInit) {
      _hasInit = true;
    }
  }

  final Random _random = Random();

  void initLoading({String? message}) {
    loadingMessage = message ?? "Salvando...";
    _isLoading = true;
    emit(state.copyWith(isLoading: _isLoading, loadingText: loadingMessage));
  }

  void finishLoading() {
    _isLoading = false;
    emit(state.copyWith(isLoading: _isLoading));
  }

  // void pushNotification(
  //   PushNotificationModel notification, {
  //   int duration = 10,
  // }) {
  //   Future.delayed(const Duration(milliseconds: 80), () {
  //     emit(state.copyWith(
  //       pushNotification: notification,
  //       duration: duration,
  //     ));
  //   });
  //   _reset(resetPushNotification: true);
  // }
  //
  // void alert(ResponseStatusModel response, {int duration = 8}) {
  //   Future.delayed(const Duration(milliseconds: 80), () {
  //     emit(state.copyWith(
  //       alertResponse: response,
  //       duration: duration,
  //     ));
  //   });
  //   _reset(resetAlert: true);
  // }
  //
  // void snackBar(
  //   ResponseStatusModel response, {
  //   int duration = 8,
  //   bool canClose = true,
  // }) {
  //   Future.delayed(const Duration(milliseconds: 100), () {
  //     emit(state.copyWith(
  //       snackBarResponse: response,
  //       duration: duration,
  //       canClose: canClose,
  //     ));
  //   });
  //
  //   _reset(resetSnackBar: true);
  // }
  //
  // void _reset({
  //   bool resetSnackBar = false,
  //   bool resetAlert = false,
  //   bool resetPushNotification = false,
  // }) {
  //   Future.delayed(Duration(milliseconds: 200 + _random.nextInt(500)), () {
  //     if (resetSnackBar) {
  //       emit(state.copyWith(
  //         pushNotification: state.pushNotification,
  //         snackBarResponse: null,
  //         alertResponse: state.alertResponse,
  //       ));
  //     }
  //     if (resetAlert) {
  //       emit(state.copyWith(
  //         pushNotification: state.pushNotification,
  //         alertResponse: null,
  //         snackBarResponse: state.snackBarResponse,
  //       ));
  //     }
  //     if (resetPushNotification) {
  //       emit(state.copyWith(
  //         pushNotification: null,
  //         snackBarResponse: state.snackBarResponse,
  //         alertResponse: state.alertResponse,
  //       ));
  //     }
  //   });
  // }
}
