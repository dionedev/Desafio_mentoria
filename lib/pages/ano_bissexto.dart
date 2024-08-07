import 'package:flutter/material.dart';

class AnoBissexto extends StatefulWidget {
  const AnoBissexto({super.key});

  @override
  State<AnoBissexto> createState() => _AnoBissextoState();
}

class _AnoBissextoState extends State<AnoBissexto> {
  TextEditingController inputController = TextEditingController();
  String resultado = '';

  verificaAnoBissexto() {
    setState(() {
      final ano = int.tryParse(inputController.text);

      if (ano != null) {
        if (ano % 400 == 0) {
          resultado = 'O ano $ano é bissexto';
        } else if (ano % 100 == 0) {
          resultado = 'O ano $ano não é bissexto';
        } else if (ano % 4 == 0) {
          resultado = 'O ano $ano é bissexto';
        } else {
          resultado = 'O ano $ano não é bissexto';
        }
      } else {
        resultado = 'Por favor, digite um ano.';
      }

      inputController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Ano Bissexto'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  resultado,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: TextField(
                    controller: inputController,
                    decoration: const InputDecoration(
                      labelText: 'Ano',
                      hintText: 'Ex. 2024',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    verificaAnoBissexto();
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
