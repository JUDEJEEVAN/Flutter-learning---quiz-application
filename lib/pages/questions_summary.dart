import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_application/custom_widgets/questions_summary/question_indicator.dart';
import 'package:quiz_application/data/data.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (data) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionIndicator(
                      isCorrect: data['correct_answer'] == data['user_answer'],
                      index: (data['question_index']) as int,
                    ),
                    const Gap(20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text((data['question']) as String,
                              style: mainTextLevel3),
                          const Gap(5),
                          Text((data['user_answer']) as String,
                              style: userAnswerText),
                          Text((data['correct_answer']) as String,
                              style: answerText),
                          const Gap(10),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
