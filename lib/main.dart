import 'package:flutter/material.dart';

void main() {
  runApp(_AppIMCState());
}

class _AppIMCState extends StatefulWidget {
  const _AppIMCState({super.key});

  @override
  State<_AppIMCState> createState() => __AppIMCStateState();
}

class __AppIMCStateState extends State<_AppIMCState> {
  final TextEditingController controllerAltura = TextEditingController();
  final TextEditingController controllerPeso = TextEditingController();
  String resultado = '';

  calcularImc() {
    final altura = double.tryParse(controllerAltura.text);
    final peso = double.tryParse(controllerPeso.text);

    if (altura == null || peso == null) {
      resultado = 'Informe uma altura e peso';
      return;
    }

    resultado = 'O IMC é ${peso / (altura * altura)}';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calcule seu IMC'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                TextField(
                  controller: controllerAltura,
                  decoration: const InputDecoration(
                    hintText: 'Digite sua altura',
                    labelText: 'Altura',
                    border: OutlineInputBorder(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: TextField(
                    controller: controllerPeso,
                    decoration: const InputDecoration(
                      hintText: 'Digite seu peso',
                      labelText: 'Peso',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    calcularImc();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 48),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text('Calcular'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text('$resultado'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
