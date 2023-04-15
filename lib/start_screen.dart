import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(142, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter the fun way',
            style: TextStyle(
                color: Color.fromARGB(255, 198, 170, 245),
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 45),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(
                    width: 2, color: Color.fromARGB(255, 98, 33, 210)),
              ),
              icon: const Icon(Icons.keyboard_arrow_right_rounded),
              label: const Text('Start the quiz'))
        ],
      ),
    );
  }
}
