import "package:equatable/equatable.dart";
import "package:gasec_mobile_app/src/domain/models/device_model.dart";

enum GasecStatus { initial, loading }

class GasecState extends Equatable {
  final bool isRefresh;
  final GasecStatus status;
  final DeviceModel? device;

  const GasecState({
    this.isRefresh = false,
    this.status = GasecStatus.initial,
    this.device,
  });

  GasecState copyWith({
    GasecStatus? status,
    DeviceModel? device,
  }) {
    return GasecState(
      isRefresh: !isRefresh,
      status: status ?? this.status,
      device: device ?? this.device,
    );
  }

  @override
  List<Object?> get props => [
        isRefresh,
        status,
        device,
      ];
}
