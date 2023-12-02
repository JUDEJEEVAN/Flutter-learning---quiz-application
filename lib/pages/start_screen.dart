import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz_application/data/data.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});

  final void Function() changeScreen; 

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          height: 300,
        ),
        const Gap(80),

        Text('Learn Flutter the fun way!', style: mainText),
        const Gap(50),

        OutlinedButton.icon(
            onPressed: changeScreen,
            icon: const Icon(Icons.arrow_forward, color: Colors.white,),
            label: Text(
              'Start Quiz',
              style: buttonText,
            ))
      ],
    ));
  }
}
