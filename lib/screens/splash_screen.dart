import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen(this.switchScreen, {super.key});

  final Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
        ),
        const SizedBox(
          height: 45,
        ),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        OutlinedButton.icon(
            onPressed: switchScreen(),
            icon: const Icon(
              Icons.arrow_right_rounded,
              color: Colors.white,
              size: 40,
            ),
            label: const Text(
              'Start quiz',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ))
      ],
    );
  }
}
