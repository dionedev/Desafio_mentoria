import 'package:flutter/material.dart';

class ParOuImpar extends StatefulWidget {
  const ParOuImpar({super.key});

  @override
  State<ParOuImpar> createState() => _ParOuImparState();
}

class _ParOuImparState extends State<ParOuImpar> {
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
                  'Par/Impar',
                  style: TextStyle(fontSize: 70),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Número',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(270, 48),
                  ),
                  child: const Text(
                    'Verificar',
                    style: TextStyle(
                      fontSize: 16,
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
