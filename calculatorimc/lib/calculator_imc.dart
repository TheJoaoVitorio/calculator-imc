import 'package:calculatorimc/alert_message.dart';
import 'package:calculatorimc/button_calculator.dart';
import 'package:calculatorimc/circle_info_imc.dart';
import 'package:calculatorimc/input_calculator.dart';
import 'package:flutter/material.dart';

class calculatorImc extends StatefulWidget {
  const calculatorImc({super.key});

  @override
  State<calculatorImc> createState() => _calculatorImcState();
}

class _calculatorImcState extends State<calculatorImc> {
  late TextEditingController pesoController;
  late TextEditingController alturaController;

  dynamic imc;
  dynamic classification;
  dynamic colorResult;

  @override
  void initState() {
    super.initState();
    pesoController = TextEditingController(text: '');
    alturaController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imc == null
                ? AlertMessage()
                : CircleInfoImc(
                  colorResult: colorResult,
                  imc: imc,
                  classification: classification,
                ),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Seu peso'),
                    SizedBox(height: 6),
                    Container(
                      width: 75,
                      child: InputCalculator(
                        controller: pesoController,
                        suffixText: 'kg',
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 22),
                Column(
                  children: [
                    Text('Sua altura'),
                    SizedBox(height: 6),
                    Container(
                      width: 75,
                      child: InputCalculator(
                        controller: alturaController,
                        suffixText: 'm',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            ButtonCalculator(
              onPressed: () {
                try {
                  double peso = double.parse(pesoController.text);
                  double altura = double.parse(alturaController.text);

                  setState(() {
                    imc = peso / (altura * altura);
                    classification = getClassificationIMC(imc);
                    colorResult = getColorIMC(imc);
                  });
                } on Exception {
                  setState(() {
                    pesoController.text = '';
                    alturaController.text = '';
                    imc = null;
                    classification = null;
                    colorResult = Colors.redAccent;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String getClassificationIMC(double IMC) {
    if (IMC <= 18.5) {
      return 'Abaixo do peso';
    } else if (IMC > 18.5 && IMC <= 24.9) {
      return 'Peso normal';
    } else if (IMC > 25.0 && IMC < 29.9) {
      return 'Sobrepeso';
    } else if (IMC > 30.0 && IMC < 34.9) {
      return 'Obsidade Grau I';
    } else if (IMC > 35.0 && IMC < 39.9) {
      return 'Obsidade Grau II';
    } else if (IMC > 40.0) {
      return 'Obsidade Grau III';
    }
    return '';
  }

  Color getColorIMC(double IMC) {
    if (IMC <= 18.5) {
      return Colors.lightBlueAccent;
    } else if (IMC > 18.5 && IMC <= 24.9) {
      return Colors.lightGreen;
    } else if (IMC > 25.0 && IMC < 29.9) {
      return Color.fromARGB(255, 221, 83, 148);
    } else if (IMC > 30.0 && IMC < 34.9) {
      return Colors.orange;
    } else if (IMC > 35.0 && IMC < 39.9) {
      return const Color.fromARGB(255, 224, 50, 37);
    } else if (IMC > 40.0) {
      return const Color.fromARGB(255, 255, 22, 5);
    }
    return Colors.redAccent;
  }
}
