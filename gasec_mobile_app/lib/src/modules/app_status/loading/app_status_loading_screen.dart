import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:gasec_mobile_app/src/modules/app_status/bloc/app_status_cubit.dart";
import "package:gasec_mobile_app/src/modules/app_status/bloc/app_status_state.dart";

class AppStatusLoadingScreen extends StatefulWidget {
  const AppStatusLoadingScreen({super.key});

  @override
  State<AppStatusLoadingScreen> createState() => _AppStatusLoadingScreenState();
}

class _AppStatusLoadingScreenState extends State<AppStatusLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    print("build AppStatusLoadingScreen ${Modular.to.path}");
    return Scaffold(
      body: BlocBuilder<AppStatusCubit, AppStatusState>(
        builder: (context, state) {
          return Column(
            children: [
              const Spacer(),
              Container(height: 200, width: 200, color: Colors.amberAccent),
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text("Gasec"),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
