import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/gasec/bloc/gasec_cubit.dart";
import "package:gasec_mobile_app/src/modules/gasec/connect/connect_screen.dart";

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  final GasecCubit _connectionCubit = Modular.get<GasecCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _connectionCubit,
      child: const ConnectScreen(),
    );
  }
}
