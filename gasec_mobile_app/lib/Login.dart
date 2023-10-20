import 'package:flutter/material.dart';
import 'package:gasec_mobile_app/main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF37474F)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/logo.png",
                        width: 200,
                        height: 150,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(300)),
                    )),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Bem Vindo(a)!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Insira as credenciais do dispositivo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        hintText: "IP do dispositivo",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: ElevatedButton(
                    child: const Text(
                      "Conectar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainApp()))
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
