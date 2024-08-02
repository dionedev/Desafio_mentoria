import 'package:flutter/material.dart';

class CalculaMedia extends StatefulWidget {
  const CalculaMedia({super.key});

  @override
  State<CalculaMedia> createState() => _CalculaMediaState();
}

class _CalculaMediaState extends State<CalculaMedia> {
  TextEditingController controllerPrimeiroNumero = TextEditingController();
  TextEditingController controllerSegundoNumero = TextEditingController();
  TextEditingController controllerTerceiroNumero = TextEditingController();

  String resultadoMedia = '';

  calcularMedia() {
    final primeiroNumero = double.tryParse(controllerPrimeiroNumero.text);
    final segundoNumero = double.tryParse(controllerSegundoNumero.text);
    final terceiroNumero = double.tryParse(controllerTerceiroNumero.text);

    if (primeiroNumero == null ||
        segundoNumero == null ||
        terceiroNumero == null) {
      resultadoMedia = 'Insira um número';
      return;
    }
    resultadoMedia =
        'Média: ${(primeiroNumero + segundoNumero + terceiroNumero) / 3}';

    controllerPrimeiroNumero.clear();
    controllerSegundoNumero.clear();
    controllerTerceiroNumero.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Média'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controllerPrimeiroNumero,
              decoration: const InputDecoration(
                hintText: 'Digite o primeiro número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextField(
                controller: controllerSegundoNumero,
                decoration: const InputDecoration(
                  hintText: 'Digite o segundo número',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            TextField(
              controller: controllerTerceiroNumero,
              decoration: const InputDecoration(
                hintText: 'Digite o terceiro número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: ElevatedButton(
                onPressed: () {
                  calcularMedia();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(270, 48),
                ),
                child: const Text(
                  'Calcular Média',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(45, 44, 44, 1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Text(
              '$resultadoMedia',
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      )),
    );
  }
}
