import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gasec_mobile_app/src/modules/gasec/bloc/gasec_cubit.dart';
import 'package:gasec_mobile_app/src/modules/gasec/bloc/gasec_state.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  final TextEditingController ipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<GasecCubit, GasecState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFF37474F),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 70.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        "assets/logo.png",
                        width: 200.0,
                        height: 150.0,
                      ),
                    ),
                    const SizedBox(height: 70.0),
                    const Text(
                      "Bem Vindo(a)!",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      "Insira o endereço IPv4 do dispositivo para iniciar uma conexão",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ipController,
                      style: const TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10.0),
                        hintText: "IP do dispositivo",
                        filled: true,
                        fillColor: const Color(0xFFD3D0CB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    SizedBox(
                      height: 50.0,
                      width: 160.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF587B7F),
                          foregroundColor: Colors.black38,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          // TODO: implementar conexão
                          Modular.get<GasecCubit>().connectDevice(
                            ipController.text,
                          );
                        },
                        child: const Text(
                          "Conectar",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 24.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
