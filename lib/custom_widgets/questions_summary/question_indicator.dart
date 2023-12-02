import 'package:flutter/material.dart';

class QuestionIndicator extends StatelessWidget {
  const QuestionIndicator({super.key, required this.isCorrect, required this.index});
  final bool isCorrect;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green.shade300 : Colors.red.shade300,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(child: Text((index + 1).toString(), style: const TextStyle(fontWeight: FontWeight.bold),)),
    );
  }
}