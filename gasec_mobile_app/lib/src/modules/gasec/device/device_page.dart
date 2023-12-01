import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/gasec/bloc/gasec_cubit.dart";
import "package:gasec_mobile_app/src/modules/gasec/device/device_screen.dart";

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final GasecCubit _connectionCubit = Modular.get<GasecCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _connectionCubit,
      child: const DeviceScreen(),
    );
  }
}
