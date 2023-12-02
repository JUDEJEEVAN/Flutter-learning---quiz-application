import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_application/custom_widgets/answer_button.dart';
import 'package:quiz_application/data/data.dart';
import 'package:quiz_application/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionCount = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      questionCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionCount];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: mainText,
              textAlign: TextAlign.center,
            ),
            const Gap(30),
            ...currentQuestion.getShuffeledAnswers().map((answer) {
              return AnswerButton(
                text: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
