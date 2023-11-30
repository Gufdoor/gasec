

enum AppWrapStatus { initial }

// class AppWrapState extends Equatable {
class AppWrapState {
  final AppWrapStatus status;
  // final ResponseStatusModel? alertResponse;
  // final ResponseStatusModel? snackBarResponse;
  // final PushNotificationModel? pushNotification;
  final bool isLoading;
  final String loadingText;
  final int duration;
  final bool canClose;
  final bool refresh;

  const AppWrapState({
    this.status = AppWrapStatus.initial,
    // this.alertResponse,
    // this.snackBarResponse,
    // this.pushNotification,
    this.isLoading = false,
    this.loadingText = "",
    this.duration = 8,
    this.canClose = true,
    this.refresh = false,
  });

  AppWrapState copyWith({
    AppWrapStatus? status,
    // ResponseStatusModel? alertResponse,
    // ResponseStatusModel? snackBarResponse,
    // PushNotificationModel? pushNotification,
    bool? isLoading,
    String? loadingText,
    int? duration,
    bool? canClose,
  }) {
    return AppWrapState(
      status: status ?? this.status,
      // alertResponse: alertResponse,
      // snackBarResponse: snackBarResponse,
      // pushNotification: pushNotification,
      isLoading: isLoading ?? this.isLoading,
      loadingText: loadingText ?? this.loadingText,
      duration: duration ?? this.duration,
      canClose: canClose ?? this.canClose,
      refresh: !refresh,
    );
  }

  @override
  List<Object?> get props => [
        status,
        // alertResponse,
        // snackBarResponse,
        // pushNotification,
        isLoading,
        loadingText,
        duration,
        canClose,
        refresh,
      ];
}
