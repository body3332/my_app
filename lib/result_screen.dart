import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  const ResultScreen({super.key, required this.bmi});

  String getResult() {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }

  Color getColor() {
    if (bmi < 18.5) return Colors.orange;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.yellow;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Your Result",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              getResult(),
              style: TextStyle(
                fontSize: 22,
                color: getColor(),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              bmi.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Re - Calculate",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
