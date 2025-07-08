import 'dart:math';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

// External function to generate a random dice number and update UI
void rollDice(Function(int) updateDice) {
  int newNumber = Random().nextInt(6) + 1;
  updateDice(newNumber);
}

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  int currentDice = 1;

  void updateDice(int number) {
    setState(() {
      currentDice = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 26, 2, 80),
            Color.fromARGB(255, 45, 7, 98),
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/dice-$currentDice.png', width: 200),
          const SizedBox(height: 20),
          SizedBox(
            width: 160,
            height: 50,
            child: TextButton(
              onPressed: () => rollDice(updateDice),
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                shadowColor: Colors.black45,
              ),
              child: const Text('Roll Dice'),
            ),
          ),
        ],
      ),
    );
  }
}
