import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers,required this.onTap});

  final List<String> chosenAnswers;
  final void Function() onTap;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });

      if (summary[i]['correct_answer'] == summary[i]['user_answer']){
        print(summary[i]['correct_answer']);
        print(summary[i]['user_answer']);
        print('################');

        summary[i]['color'] = Colors.green.shade200;
      }else{
        summary[i]['color'] = Colors.red.shade200;
      }
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $numCorrectQuestions out $numTotalQuestions questions correctly!',
                  style: const TextStyle(
                    color:Color.fromARGB(255, 228, 195, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                  ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                  onPressed: onTap,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  label: const Text('Restart Quiz!'),
                  icon: const Icon(Icons.rotate_right))
            ],
          ),
        ));
  }
}
