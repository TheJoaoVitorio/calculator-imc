import 'package:flutter/material.dart';

class InputCalculator extends StatelessWidget {
  InputCalculator({required this.controller, required this.suffixText});

  final TextEditingController controller;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        suffixText: 'kg',
      ),
      keyboardType: TextInputType.number,
    );
  }
}
