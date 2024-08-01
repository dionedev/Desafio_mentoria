import 'package:app_imc/pages/conversor_temperatura.dart';
import 'package:app_imc/pages/imc_page.dart';
import 'package:app_imc/pages/jogo_dado.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'conversorTemperatura',
      routes: {
        'imc': (context) => const ImcPage(),
        'jogoDado': (context) => const JogoDado(),
        'conversorTemperatura': (context) => const ConversorTemperatura(),
      },
    );
  }
}
