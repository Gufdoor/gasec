import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gasec_mobile_app/main_module.dart';
import 'package:gasec_mobile_app/src/modules/connection/connection_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: MainModule(), child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(routeConnect);

    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: "Nunito-Sans",
        colorScheme: ThemeData().colorScheme.copyWith(
              surfaceTint: Colors.transparent,
            ),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: "Gasec",
    );
  }
}
