import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainApp());
}
class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

   final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;
  late Color _configColor = Color.fromARGB(255, 57, 62, 65);
  late Color _homeColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      home: Scaffold(
        // appBar: AppBar(
        //   // title: Container(
        //   //           alignment: AlignmentDirectional.center,
        //   //           width: 150,
        //   //           height: 100,
        //   //           child: Text("Dispositivo", style: TextStyle(color: Colors.white70),),
        //   //           color: Color.fromARGB(255, 57, 62, 65),
        //   //         ),
        //   title: Row(
        //     children: [ 
        //       Container(
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //             color: Color.fromARGB(255, 161, 207, 107),
        //             width: 5.0,
        //             style: BorderStyle.solid
        //           ),
        //           borderRadius: BorderRadius.circular(20),
        //           color: Color.fromARGB(255, 161, 207, 107),
        //         ),
        //         height: 100,
        //         width: MediaQuery.of(context).size.width * 0.301000,
        //       ),
        //       Container(
        //         alignment: AlignmentDirectional.center,
        //         width: MediaQuery.of(context).size.width * 0.301000,
        //         height: 100,
        //         child: Text("Dispositivo", style: TextStyle(color: Colors.white70),),
        //         color: Color.fromARGB(255, 57, 62, 65),
        //       ),
        //       Container(
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //             color: Color.fromARGB(255, 161, 207, 107),
        //             width: 5.0,
        //             style: BorderStyle.solid
        //           ),
        //           borderRadius: BorderRadius.circular(20),
        //           color: Color.fromARGB(255, 161, 207, 107),
        //         ),
        //         height: 100,
        //         width: MediaQuery.of(context).size.width * 0.301000,
        //       ),],
        //   ),
        //   centerTitle: true,
        //   backgroundColor: const Color.fromARGB(255, 57, 62, 65),
        // ),
        
        body: PageView(
        controller: pageController,
        children: const <Widget>[
          Center(
            child: Home(),
          ),
          Center(
            child: Config(),
          ),
        ],
      ),
      
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.all(0.0),
          height: 60.0,
          // color: Colors.amber,
          // shape: const CircularNotchedRectangle(),
          // notchMargin: 5.0,
          // clipBehavior: Clip.antiAlias,
          child: SizedBox(
            // height: kBottomNavigationBarHeight,
            height: 50.0,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color.fromARGB(255, 88, 123, 127),
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Color.fromARGB(255, 57, 62, 65),
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                  // pageController.jumpToPage(index);
                  if(index == 0){
                    _configColor = Color.fromARGB(255, 57, 62, 65);
                  } else {
                    _configColor = Colors.white;
                  }
                  pageController.jumpToPage(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 25.0,),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/config.png', height:25, color: _configColor),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  String _theme = 'Light';
  var _themeData = ThemeData.light();
  @override
  void initState() {
    super.initState();
    // _loadTheme();
  }
  // Carregando o tema salvo pelo usuário
  // _loadTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _theme = (prefs.getString('theme') ?? 'Light');
  //     _themeData = _theme == 'Dark' ? ThemeData.dark() : ThemeData.light();
  //   });
  // }
  // // Carregando o tema salvo pelo usuário
  // _setTheme(theme) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _theme = theme;
  //     _themeData = theme == 'Dark' ? ThemeData.dark() : ThemeData.light();
  //     prefs.setString('theme', theme);
  //   });
  // }

}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return          
             Container(
             decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 57, 62, 65),
                    width: 20.0,
                    style: BorderStyle.solid
                  ),
                  // borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 161, 207, 107),
                ),
            alignment: Alignment.center,
            // margin: EdgeInsets.fromLTRB(16, 8, 8, 16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: 
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(
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
                        child: Text("Dispositivo", style: TextStyle(color: Colors.white70, fontSize: 20.0)),
                        // color: Color.fromARGB(255, 57, 62, 65),
                      ),],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
                    Column(
                      children: 
                      [
                        Row(
                          children: [Image.asset('assets/Raster.png', height: 120, color: Color.fromARGB(255, 57, 62, 65),),],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [Text("192.108.0.0", style: TextStyle(color: Colors.white70, fontSize: 20.0)),],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(
                        alignment: AlignmentDirectional.center,
                        width: 180,
                        height: 90,
                        child: Text("Status: Ativo", style: TextStyle(color: Colors.white70, fontSize: 20.0)),
                        color: Color.fromARGB(255, 88, 123, 127),
                      ),]
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
                    Container(
                      width: 180,
                      height: 100,
                      color: Color.fromARGB(255, 88, 123, 127),
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Container(
                              alignment: AlignmentDirectional.center,
                              child: Text("Recomendações:", style: TextStyle(color: Colors.white70, fontSize: 20.0)),
                            ),]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Container(
                                alignment: AlignmentDirectional.center,
                                child: Text("Evacue o local", style: TextStyle(color: Colors.white70, fontSize: 20.0)),
                              ),
                            ]
                          ),
                        ]
                      )
                    )
                  ]
                ),
                SizedBox(height: 20),
                SizedBox(width: MediaQuery.of(context).size.width * 0.7, height: 5, child: Container(color: Color.fromARGB(255, 57, 62, 65), height: 5, width: MediaQuery.of(context).size.width * 0.7,),),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 226, 192, 68),
                            shape: BeveledRectangleBorder()
                          ),
                          onPressed: () {
                              print('1');
                          },
                          child: Text("Chamar Emergência", style: TextStyle(color: Color.fromARGB(255, 57, 62, 65), fontSize: 20.0)),
                        )]
                ),
              ]
            )
          );
  }
}

class Config extends StatelessWidget {
  const Config({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Container(
            decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 57, 62, 65),
                    width: 20.0,
                    style: BorderStyle.solid
                  ),
                  // borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 88, 123, 127),
                ),
            alignment: Alignment.center,
            // margin: EdgeInsets.fromLTRB(16, 8, 8, 16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: 
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(
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
                        child: Text("Gerenciar Dispositivo", style: TextStyle(color: Colors.white70, fontSize: 20.0)),
                        // color: Color.fromARGB(255, 57, 62, 65),
                      ),],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
                    Column(
                      children: 
                      [
                        Row(
                          children: [Image.asset('assets/Raster.png', height: 120, color: Color.fromARGB(255, 57, 62, 65),),],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [Text("192.108.0.0", style: TextStyle(color: Colors.white70, fontSize: 20.0)),],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 211, 208, 203),
                            shape: BeveledRectangleBorder()
                          ),
                          onPressed: () {
                              print('1');
                          },
                          child: Text("Perfil de Ambiente", style: TextStyle(color: Color.fromARGB(255, 57, 62, 65), fontSize: 20.0)),
                      //   Container(
                      //   alignment: AlignmentDirectional.center,
                      //   width: MediaQuery.of(context).size.width * 0.6,
                      //   height: 60,
                      //   child: Text("Perfil de Ambiente", style: TextStyle(color: Color.fromARGB(255, 57, 62, 65), fontSize: 20.0)),
                      //   color: Color.fromARGB(255, 211, 208, 203),
                      ),]
                ),
                SizedBox(height: 20),
                SizedBox(width: MediaQuery.of(context).size.width * 0.7, height: 5, child: Container(color: Color.fromARGB(255, 57, 62, 65), height: 5, width: MediaQuery.of(context).size.width * 0.7,),),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 232, 116, 97),
                            shape: BeveledRectangleBorder()
                          ),
                          onPressed: () {
                              print('1');
                          },
                          child: Text("Desconectar", style: TextStyle(color: Color.fromARGB(255, 57, 62, 65), fontSize: 20.0)),
                      //   Container(
                      //   alignment: AlignmentDirectional.center,
                      //   width: 220,
                      //   height: 60,
                      //   child: Text("Desconectar", style: TextStyle(color: Colors.white70, fontSize: 20.0)),
                      //   color: Color.fromARGB(255, 232, 116, 97),
                      ),]
                ),
              ]
            )
          )
    ;
  }
}