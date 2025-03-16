import 'package:flutter/material.dart';

class ButtonCalculator extends StatelessWidget {
  ButtonCalculator({
    required this.onPressed,
    //required this.
  });

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPressed(),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(180, 50),
        maximumSize: Size(250, 80),
        foregroundColor: Colors.white,
        padding: EdgeInsets.all(16),
        backgroundColor: Colors.redAccent,
        side: BorderSide(color: Colors.white, width: 2),
      ),
      child: Text('Calcular', style: TextStyle(fontSize: 24)),
    );
  }
}
