import "package:equatable/equatable.dart";

enum ConnectStatus { initial, loading }

class ConnectionState extends Equatable {
  final ConnectStatus status;
  final bool isRefresh;

  const ConnectionState({
    this.status = ConnectStatus.initial,
    this.isRefresh = false,
  });

  ConnectionState copyWith({
    ConnectStatus? status,
  }) {
    return ConnectionState(
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
