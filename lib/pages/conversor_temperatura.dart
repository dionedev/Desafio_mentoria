import 'package:flutter/material.dart';

class ConversorTemperatura extends StatefulWidget {
  const ConversorTemperatura({super.key});

  @override
  State<ConversorTemperatura> createState() => _ConversorTemperaturaState();
}

class _ConversorTemperaturaState extends State<ConversorTemperatura> {
  TextEditingController temperaturaController = TextEditingController();

  double resultadoConvertido = 0.0;
  String resultadoFormatado = '';

  void temperaturaEmFahrenheit() {
    final temperaturaDigitada = double.tryParse(temperaturaController.text);

    if (temperaturaDigitada == null) {
      return;
    }

    resultadoConvertido = (temperaturaDigitada * 1.8) + 32;
    resultadoFormatado = resultadoConvertido.toStringAsFixed(1);
  }

  void temperaturaEmCelsius() {
    final temperaturaDigitada = double.tryParse(temperaturaController.text);

    if (temperaturaDigitada == null) {
      return;
    }

    resultadoConvertido = (temperaturaDigitada - 32) / 1.8;
    resultadoFormatado = resultadoConvertido.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Temperatura'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: temperaturaController,
              decoration: const InputDecoration(
                hintText: 'Digite uma temperatura',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                '$resultadoFormatado',
                style:
                    const TextStyle(fontSize: 70, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    temperaturaEmCelsius();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 48),
                  ),
                  child: const Text(
                    'Celsius',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    temperaturaEmFahrenheit();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 48),
                  ),
                  child: const Text(
                    'Fahrenheit',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
