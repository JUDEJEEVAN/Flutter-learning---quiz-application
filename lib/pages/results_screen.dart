import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_application/data/data.dart';
import 'package:quiz_application/data/questions.dart';
import 'package:quiz_application/pages/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummeryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummeryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: mainTextLevel2,
              textAlign: TextAlign.center,
            ),
            const Gap(30),
            QuestionsSummary(summaryData: summaryData),
            const Gap(30),
            TextButton.icon(
              icon: const Icon(Icons.restart_alt_sharp, color: Colors.white,),
              onPressed: () {},
              label: Text(
                'restart quiz',
                style: resetButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
