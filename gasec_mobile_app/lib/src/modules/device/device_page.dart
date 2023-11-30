import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/device/bloc/device_cubit.dart";
import "package:gasec_mobile_app/src/modules/device/device_screen.dart";

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final DeviceCubit _deviceCubit = Modular.get<DeviceCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _deviceCubit,
      child: const DeviceScreen(),
    );
  }
}
