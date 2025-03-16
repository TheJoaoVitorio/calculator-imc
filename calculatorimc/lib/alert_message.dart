import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  const AlertMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Adicione seu peso e altura para calcular seu IMC',
      style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
      textAlign: TextAlign.center,
    );
  }
}
