import 'package:flutter/material.dart';

class ParOuImpar extends StatefulWidget {
  const ParOuImpar({super.key});

  @override
  State<ParOuImpar> createState() => _ParOuImparState();
}

class _ParOuImparState extends State<ParOuImpar> {
  TextEditingController inputController = TextEditingController();
  String resultado = '';

  verificaParOuImpar() {
    setState(() {
      final numeroDigitado = int.tryParse(inputController.text);

      if (numeroDigitado != null) {
        if (numeroDigitado % 2 == 0) {
          resultado = 'Par';
        } else {
          resultado = 'Impar';
        }
      } else {
        resultado = 'Por favor, digite um número.';
      }

      inputController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Par ou Impar'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  resultado,
                  style: TextStyle(
                    fontSize:
                        resultado == 'Par' || resultado == 'Impar' ? 70 : 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: TextField(
                    controller: inputController,
                    decoration: const InputDecoration(
                      labelText: 'Número',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    verificaParOuImpar();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(270, 48),
                  ),
                  child: const Text(
                    'Verificar',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(45, 44, 44, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
