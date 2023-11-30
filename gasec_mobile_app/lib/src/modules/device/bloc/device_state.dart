import "package:equatable/equatable.dart";

enum DeviceStatus { initial, loading }

class DeviceState extends Equatable {
  final DeviceStatus status;
  final bool isRefresh;

  const DeviceState({
    this.status = DeviceStatus.initial,
    this.isRefresh = false,
  });

  DeviceState copyWith({
    DeviceStatus? status,
  }) {
    return DeviceState(
      status: status ?? this.status,
      isRefresh: !isRefresh,
    );
  }

  @override
  List<Object?> get props => [
        status,
        isRefresh,
      ];
}
