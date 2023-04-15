import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {
        required this.answer, 
        required this.onTap, 
        super.key
      }
    );

  final String answer;
  final void Function() onTap;

  @override
  Widget build(context) {

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 43, 2, 54),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      child: Text(
        answer, 
        textAlign: TextAlign.center,
        ),
    );
  }
}
