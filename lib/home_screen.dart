import 'package:flutter/material.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 150;
  int weight = 60;
  int age = 26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Column(
        children: [
          /// Gender
          Expanded(
            child: Row(
              children: [
                genderCard("Male", Icons.male, isMale, () {
                  setState(() => isMale = true);
                }),
                genderCard("Female", Icons.female, !isMale, () {
                  setState(() => isMale = false);
                }),
              ],
            ),
          ),

          /// Height
          Expanded(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Height"),
                  Text("${height.toInt()} cm",
                      style: const TextStyle(fontSize: 30)),
                  Slider(
                    min: 100,
                    max: 220,
                    value: height,
                    onChanged: (value) {
                      setState(() => height = value);
                    },
                  ),
                ],
              ),
            ),
          ),

          /// Weight & Age
          Expanded(
            child: Row(
              children: [
                counterCard("Weight", weight, () {
                  setState(() => weight++);
                }, () {
                  setState(() => weight--);
                }),
                counterCard("Age", age, () {
                  setState(() => age++);
                }, () {
                  setState(() => age--);
                }),
              ],
            ),
          ),

          /// Button
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              child: const Text("Calculate", style: TextStyle(fontSize: 22)),
              onPressed: () {
                double bmi =
                    weight / ((height / 100) * (height / 100));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultScreen(bmi: bmi),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget genderCard(
      String text, IconData icon, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: active ? Colors.pink : Colors.grey[800],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }

  Widget counterCard(
      String text, int value, VoidCallback plus, VoidCallback minus) {
    return Expanded(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            Text("$value", style: const TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: minus, icon: const Icon(Icons.remove)),
                IconButton(onPressed: plus, icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
