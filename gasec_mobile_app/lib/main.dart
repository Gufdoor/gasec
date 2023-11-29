import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gasec_mobile_app/main_module.dart';
import 'package:gasec_mobile_app/src/modules/app_status/app_status_module.dart';
import 'package:gasec_mobile_app/src/modules/connection/connect/connect_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print("main");
  runApp(ModularApp(module: MainModule(), child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // final PageController pageController = PageController(initialPage: 0);
  // late int selectedIndex = 0;
  // late Color configColor = const Color.fromARGB(255, 57, 62, 65);

  @override
  Widget build(BuildContext context) {
    // ThemeData themeData = ThemeData.dark();
    Modular.setInitialRoute(routeAppLoading);
    print("build main ${Modular.to.path}");
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

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: themeData,
    //   home: Scaffold(
    //     body: PageView(
    //       controller: pageController,
    //       children: const [
    //         Center(child: DeviceStatusTab()),
    //         Center(child: DeviceConfigTab()),
    //       ],
    //     ),
    //     bottomNavigationBar: BottomAppBar(
    //       padding: const EdgeInsets.all(0.0),
    //       height: 60.0,
    //       child: SizedBox(
    //         height: 50.0,
    //         child: BottomNavigationBar(
    //           type: BottomNavigationBarType.fixed,
    //           backgroundColor: const Color.fromARGB(255, 88, 123, 127),
    //           currentIndex: selectedIndex,
    //           selectedItemColor: Colors.white,
    //           unselectedItemColor: const Color.fromARGB(255, 57, 62, 65),
    //           onTap: (index) {
    //             setState(() {
    //               selectedIndex = index;
    //               if (index == 0) {
    //                 configColor = const Color.fromARGB(255, 57, 62, 65);
    //               } else {
    //                 configColor = Colors.white;
    //               }
    //               pageController.jumpToPage(index);
    //             });
    //           },
    //           items: [
    //             const BottomNavigationBarItem(
    //               icon: Icon(
    //                 Icons.home_outlined,
    //                 size: 25.0,
    //               ),
    //               label: 'Home',
    //             ),
    //             BottomNavigationBarItem(
    //               icon: Image.asset(
    //                 'assets/config.png',
    //                 height: 25,
    //                 color: configColor,
    //               ),
    //               label: 'Configurações',
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class DeviceStatusTab extends StatelessWidget {
  const DeviceStatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 57, 62, 65),
          width: 20.0,
          style: BorderStyle.solid,
        ),
        color: const Color.fromARGB(255, 161, 207, 107),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 57, 62, 65),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  border: Border(
                    left: BorderSide(
                      color: Color.fromARGB(255, 57, 62, 65),
                      width: 5.0,
                    ),
                    right: BorderSide(
                      color: Color.fromARGB(255, 57, 62, 65),
                      width: 5.0,
                    ),
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 57, 62, 65),
                      width: 5.0,
                    ),
                  ),
                ),
                alignment: AlignmentDirectional.center,
                width: MediaQuery.of(context).size.width * 0.4,
                height: 60,
                child: const Text(
                  "Dispositivo",
                  style: TextStyle(color: Colors.white70, fontSize: 20.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/Raster.png',
                        height: 120,
                        color: const Color.fromARGB(255, 57, 62, 65),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      Text(
                        "192.108.0.0",
                        style: TextStyle(color: Colors.white70, fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 100,
                color: const Color.fromARGB(255, 88, 123, 127),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          child: const Text(
                            "Status:",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          child: const Text(
                            "Vazamento\n Detectado",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 180,
                height: 100,
                color: const Color.fromARGB(255, 88, 123, 127),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          child: const Text(
                            "Recomendações:",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          child: const Text(
                            "Evacue o local",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 5,
            child: Container(
              color: const Color.fromARGB(255, 57, 62, 65),
              height: 5,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 226, 192, 68),
                    shape: const BeveledRectangleBorder()),
                onPressed: () {},
                child: const Text(
                  "Chamar Emergência",
                  style: TextStyle(
                    color: Color.fromARGB(255, 57, 62, 65),
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DeviceConfigTab extends StatefulWidget {
  const DeviceConfigTab({super.key});

  @override
  State<DeviceConfigTab> createState() => _DeviceConfigTabState();
}

class _DeviceConfigTabState extends State<DeviceConfigTab> {
  bool get wantKeepAlive => true;
  Color color1 = const Color.fromARGB(255, 211, 208, 203);
  Color color2 = const Color.fromARGB(255, 211, 208, 203);
  Color color3 = const Color.fromARGB(255, 211, 208, 203);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 57, 62, 65),
          width: 20.0,
          style: BorderStyle.solid,
        ),
        color: const Color.fromARGB(255, 88, 123, 127),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 57, 62, 65),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  border: Border(
                    left: BorderSide(
                      color: Color.fromARGB(255, 57, 62, 65),
                      width: 5.0,
                    ),
                    right: BorderSide(
                      color: Color.fromARGB(255, 57, 62, 65),
                      width: 5.0,
                    ),
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 57, 62, 65),
                      width: 5.0,
                    ),
                  ),
                ),
                alignment: AlignmentDirectional.center,
                width: MediaQuery.of(context).size.width * 0.6,
                height: 60,
                child: const Text(
                  "Gerenciar Dispositivo",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/Raster.png',
                        height: 120,
                        color: const Color.fromARGB(255, 57, 62, 65),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      Text(
                        "192.108.0.0",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 211, 208, 203),
                  shape: const BeveledRectangleBorder(),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 88, 123, 127),
                            content: SizedBox(
                              width: 180,
                              height: 250,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: color1,
                                        shape: const BeveledRectangleBorder()),
                                    onPressed: () {
                                      setState(
                                        () {
                                          color2 = const Color.fromARGB(
                                            255,
                                            211,
                                            208,
                                            203,
                                          );
                                          color1 = const Color.fromARGB(
                                            255,
                                            226,
                                            192,
                                            68,
                                          );
                                          color3 = const Color.fromARGB(
                                            255,
                                            211,
                                            208,
                                            203,
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      "Espaço Aberto",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 57, 62, 65),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: color2,
                                        shape: const BeveledRectangleBorder()),
                                    onPressed: () {
                                      setState(
                                        () {
                                          color1 = const Color.fromARGB(
                                            255,
                                            211,
                                            208,
                                            203,
                                          );
                                          color2 = const Color.fromARGB(
                                            255,
                                            226,
                                            192,
                                            68,
                                          );
                                          color3 = const Color.fromARGB(
                                            255,
                                            211,
                                            208,
                                            203,
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      "Espaço Fechado",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 57, 62, 65),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: color3,
                                        shape: const BeveledRectangleBorder()),
                                    onPressed: () {
                                      setState(
                                        () {
                                          color1 = const Color.fromARGB(
                                            255,
                                            211,
                                            208,
                                            203,
                                          );
                                          color3 = const Color.fromARGB(
                                            255,
                                            226,
                                            192,
                                            68,
                                          );
                                          color2 = const Color.fromARGB(
                                            255,
                                            211,
                                            208,
                                            203,
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      "Opção 3",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 57, 62, 65),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(20.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          211,
                                          208,
                                          203,
                                        ),
                                        shape: const BeveledRectangleBorder(),
                                        side: const BorderSide(
                                          width: 1.0,
                                          color: Color.fromARGB(
                                            255,
                                            57,
                                            62,
                                            65,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            57,
                                            62,
                                            65,
                                          ),
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: const Text(
                  "Perfil de Ambiente",
                  style: TextStyle(
                    color: Color.fromARGB(255, 57, 62, 65),
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 5,
            child: Container(
              color: const Color.fromARGB(255, 57, 62, 65),
              height: 5,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 232, 116, 97),
                  shape: const BeveledRectangleBorder(),
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ConnectScreen(),
                    ),
                  )
                },
                child: const Text(
                  "Desconectar",
                  style: TextStyle(
                    color: Color.fromARGB(255, 57, 62, 65),
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class Environment extends StatelessWidget {
//   const Environment({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: const Color.fromARGB(255, 57, 62, 65),
//           width: 20.0,
//           style: BorderStyle.solid,
//         ),
//         color: const Color.fromARGB(255, 88, 123, 127),
//       ),
//       alignment: Alignment.center,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 57, 62, 65),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                   border: Border(
//                     left: BorderSide(
//                       color: Color.fromARGB(255, 57, 62, 65),
//                       width: 5.0,
//                     ),
//                     right: BorderSide(
//                       color: Color.fromARGB(255, 57, 62, 65),
//                       width: 5.0,
//                     ),
//                     bottom: BorderSide(
//                       color: Color.fromARGB(255, 57, 62, 65),
//                       width: 5.0,
//                     ),
//                   ),
//                 ),
//                 alignment: AlignmentDirectional.center,
//                 width: MediaQuery.of(context).size.width * 0.6,
//                 height: 60,
//                 child: const Text(
//                   "Gerenciar Dispositivo",
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 20.0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 40),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(
//                         'assets/Raster.png',
//                         height: 120,
//                         color: const Color.fromARGB(255, 57, 62, 65),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   const Row(
//                     children: [
//                       Text(
//                         "192.108.0.0",
//                         style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 60),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 211, 208, 203),
//                   shape: const BeveledRectangleBorder(),
//                 ),
//                 onPressed: () {},
//                 child: const Text(
//                   "Perfil de Ambiente",
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 57, 62, 65),
//                     fontSize: 20.0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.7,
//             height: 5,
//             child: Container(
//               color: const Color.fromARGB(255, 57, 62, 65),
//               height: 5,
//               width: MediaQuery.of(context).size.width * 0.7,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 232, 116, 97),
//                     shape: const BeveledRectangleBorder()),
//                 onPressed: () => {},
//                 child: const Text(
//                   "Desconectar",
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 57, 62, 65),
//                     fontSize: 20.0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
