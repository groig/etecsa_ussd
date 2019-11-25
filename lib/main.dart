import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ussd/ussd.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> launchUssd(String ussdCode) async {
    Ussd.runUssd(ussdCode);
  }

  final codes = [
    ['Consulta de saldo', '*222#'],
    ['Consulta de datos', '*222*328#'],
    ['Consulta de bonos', '*222*266#'],
    ['Consulta de plan de voz', '*222*869#'],
    ['Consulta de plan de SMS', '*222*767#'],
    ['Consulta de plan amigos', '*222*264#'],
    ['Transferencia de saldo', '*234#'],
    ['Compra de planes y paquetes', '*133#'],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Códigos ussd'),
          ),
          body: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(codes.length, (index) {
              return FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  launchUssd(codes[index][1]);
                },
                child: Text(
                  codes[index][0],
                  style: TextStyle(fontSize: 20.0),
                ),
              );
            }),
          )),
    );
  }
}
