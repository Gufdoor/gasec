import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gasec_mobile_app/src/domain/enums/environment_setting_enum.dart';
import 'package:gasec_mobile_app/src/domain/models/device_model.dart';
import 'package:gasec_mobile_app/src/modules/gasec/bloc/gasec_cubit.dart';
import 'package:gasec_mobile_app/src/modules/gasec/bloc/gasec_state.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  late int selectedTab = 0;
  late EnvironmentSettingEnum selectedEnvironment;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<GasecCubit, GasecState>(builder: (context, state) {
        selectedEnvironment = state.device!.environment;
        return Scaffold(
          backgroundColor: const Color(0xFF393E41),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                handleStatusTab(state.device!),
                handleConfigTab(state.device!),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: EdgeInsets.zero,
            height: 60.0,
            child: SizedBox(
              height: 50.0,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: const Color(0xFF587B7F),
                currentIndex: selectedTab,
                selectedItemColor: const Color(0xFFFFFFFF),
                unselectedItemColor: const Color(0xFF393E41),
                onTap: (index) {
                  setState(() => selectedTab = index);
                  pageController.jumpToPage(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 25.0,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 25.0,
                    ),
                    label: 'Configurações',
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget handleStatusTab(DeviceModel device) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(device.leakage.color),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF393E41),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            alignment: AlignmentDirectional.center,
            width: MediaQuery.of(context).size.width * 0.4,
            height: 60.0,
            child: const Text(
              "Dispositivo",
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0),
            ),
          ),
          const SizedBox(height: 40.0),
          Image.asset(
            'assets/Raster.png',
            height: 120,
            color: const Color(0xFF393E41),
          ),
          const SizedBox(height: 15.0),
          Container(
            height: 30.0,
            width: MediaQuery.of(context).size.width * 0.4,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: const Color(0xFF393E41),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              device.ip,
              style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0),
            ),
          ),
          const SizedBox(height: 40.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 100.0,
            padding: const EdgeInsets.fromLTRB(6.0, 0.0, 2.0, 6.0),
            decoration: BoxDecoration(
              color: const Color(0xFF587B7F),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Status atual: ",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: device.leakage.title,
                        style: TextStyle(
                          color: Color(device.leakage.color),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  device.leakage.text,
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 140.0,
            padding: const EdgeInsets.fromLTRB(6.0, 0.0, 2.0, 6.0),
            decoration: BoxDecoration(
              color: const Color(0xFF587B7F),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                const Text(
                  "Ações recomendadas",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  device.leakage.action,
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 5.0,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: const Color(0xFF393E41),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE2C044),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: () async {
              await FlutterPhoneDirectCaller.callNumber("193");
            },
            child: const Text(
              "Chamar emergência",
              style: TextStyle(
                color: Color(0xFF393E41),
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget handleConfigTab(DeviceModel device) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF587B7F),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF393E41),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            alignment: AlignmentDirectional.center,
            width: MediaQuery.of(context).size.width * 0.6,
            height: 60.0,
            child: const Text(
              "Gerenciar Dispositivo",
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0),
            ),
          ),
          const SizedBox(height: 40.0),
          Image.asset(
            'assets/Raster.png',
            height: 120,
            color: const Color(0xFF393E41),
          ),
          const SizedBox(height: 15.0),
          Container(
            height: 30.0,
            width: MediaQuery.of(context).size.width * 0.4,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: const Color(0xFF393E41),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              device.ip,
              style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0),
            ),
          ),
          const SizedBox(height: 40.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD3D0CB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: () => handleEnvironmentDialog(),
            child: const Text(
              "Perfil de Ambiente",
              style: TextStyle(
                color: Color(0xFF393E41),
                fontSize: 20.0,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            height: 5.0,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: const Color(0xFF393E41),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          const SizedBox(height: 15.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE87461),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: () => Modular.get<GasecCubit>().disconnectDevice(),
            child: const Text(
              "Desconectar",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleEnvironmentDialog() {
    unawaited(
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black38,
        barrierDismissible: false,
        barrierLabel: "Dismiss",
        transitionDuration: const Duration(milliseconds: 200),
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4 * anim1.value,
            sigmaY: 4 * anim1.value,
          ),
          child: FadeTransition(
            opacity: anim1,
            child: child,
          ),
        ),
        pageBuilder: (_, __, ___) {
          return BlocProvider.value(
            value: Modular.get<GasecCubit>(),
            child: buildEnvironmentDialog(),
          );
        },
      ),
    );
  }

  Widget buildEnvironmentDialog() {
    return BlocBuilder<GasecCubit, GasecState>(builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            backgroundColor: const Color(0xFF587B7F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDialogButton(
                    state.device!.environment,
                    EnvironmentSettingEnum.indoor,
                  ),
                  const SizedBox(height: 4.0),
                  buildDialogButton(
                    state.device!.environment,
                    EnvironmentSettingEnum.outdoor,
                  ),
                  const SizedBox(height: 4.0),
                  buildDialogButton(
                    state.device!.environment,
                    EnvironmentSettingEnum.forest,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 160.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA1CF6B),
                foregroundColor: Colors.black38,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () => Modular.to.pop(),
              child: const Text(
                "Salvar",
                style: TextStyle(
                  color: Color(0xFF393E41),
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget buildDialogButton(
    EnvironmentSettingEnum selectedEnvironment,
    EnvironmentSettingEnum environment,
  ) {
    final bool isEqual = selectedEnvironment == environment;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(isEqual ? 0xFFE2C044 : 0xFFD3D0CB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: () => Modular.get<GasecCubit>().setEnvironment(environment),
        child: Text(
          environment.title,
          style: const TextStyle(
            color: Color(0xFF393E41),
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
