import 'package:flutter/material.dart';

class CalculaMedia extends StatefulWidget {
  const CalculaMedia({super.key});

  @override
  State<CalculaMedia> createState() => _CalculaMediaState();
}

class _CalculaMediaState extends State<CalculaMedia> {
  TextEditingController controllerNumero = TextEditingController();
  List<double> numerosDigitados = [];
  String resultadoMedia = '';

  adicionarNumero() {
    final primeiroNumero = double.tryParse(controllerNumero.text);

    if (primeiroNumero != null) {
      setState(() {
        numerosDigitados.add(primeiroNumero);
        resultadoMedia = '';
      });
    } else {
      setState(() {
        resultadoMedia = 'Digite um número';
      });
    }
    controllerNumero.clear();
  }

  calcularMedia() {
    if (numerosDigitados.isNotEmpty) {
      double soma = 0;

      for (int i = 0; i < numerosDigitados.length; i++) {
        soma = soma + numerosDigitados[i];
      }

      double media = soma / numerosDigitados.length;
      setState(() {
        resultadoMedia = 'Média: $media';
      });
    } else {
      setState(() {
        resultadoMedia = 'Digite um número para calcular';
      });
    }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    controller: controllerNumero,
                    decoration: const InputDecoration(
                      hintText: 'Digite um número',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    adicionarNumero();
                  },
                  child: Container(
                    height: 57,
                    width: 54,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                        child: Text(
                      '+',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(
                onPressed: () {
                  calcularMedia();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(270, 48),
                ),
                child: const Text(
                  'Calcular média',
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
            ),
          ],
        ),
      )),
    );
  }
}
