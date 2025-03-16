import 'package:flutter/material.dart';

class CircleInfoImc extends StatelessWidget {
  CircleInfoImc({
    required this.colorResult,
    required this.imc,
    required this.classification,
  });

  final Color colorResult;
  final double imc;
  final String classification;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(150),
        border: Border.all(width: 10, color: colorResult),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${imc.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 36,
              color: colorResult,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            classification,
            style: TextStyle(fontSize: 20, color: colorResult),
          ),
        ],
      ),
    );
  }
}
