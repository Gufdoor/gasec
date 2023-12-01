import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";
import 'package:gasec_mobile_app/src/app_wrap_cubit.dart';

class AppWrapView extends StatefulWidget {
  const AppWrapView({super.key});

  @override
  State<AppWrapView> createState() => _AppWrapViewState();
}

class _AppWrapViewState extends State<AppWrapView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              _handleAlerts(),
              const RouterOutlet(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _handleAlerts() {
    final AppWrapCubit appCubit = AppWrapCubit.instance;

    return Column(
      children: [
        BlocProvider.value(
          value: appCubit,
          child: const Column(
            children: [],
          ),
        ),
      ],
    );
  }
}
