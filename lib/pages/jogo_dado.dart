import 'package:flutter/material.dart';

class JogoDado extends StatefulWidget {
  const JogoDado({super.key});

  @override
  State<JogoDado> createState() => _JogoDadoState();
}

class _JogoDadoState extends State<JogoDado> {
  TextEditingController numeroAleatorioController = TextEditingController();
  int resultadoDaJogada = 0;
  String caminhoDaImagem = 'assets/images/diceOne.png';

  jogarDado() {
    final numeroAleatorio = int.tryParse(numeroAleatorioController.text);

    if (numeroAleatorio == null) {
      return;
    }

    setState(() {
      resultadoDaJogada = (numeroAleatorio % 6) + 1;
      switch (resultadoDaJogada) {
        case 1:
          caminhoDaImagem = 'assets/images/diceOne.png';
          break;
        case 2:
          caminhoDaImagem = 'assets/images/diceTwo.png';
          break;
        case 3:
          caminhoDaImagem = 'assets/images/diceThree.png';
          break;
        case 4:
          caminhoDaImagem = 'assets/images/diceFour.png';
          break;
        case 5:
          caminhoDaImagem = 'assets/images/diceFive.png';
          break;
        case 6:
          caminhoDaImagem = 'assets/images/diceSix.png';
          break;
        default:
          caminhoDaImagem = 'assets/images/diceOne.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo de Dados'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                height: 400,
                child: Image.asset(caminhoDaImagem),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 24),
                child: TextField(
                  controller: numeroAleatorioController,
                  decoration: const InputDecoration(
                    hintText: 'Digite um número aleatório',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  jogarDado();
                },
                child: const Text(
                  'Jogar Dado',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(54, 55, 55, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
