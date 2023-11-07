import 'package:flutter/material.dart';
import 'package:quizz_application/screens/question_screen.dart';
import 'package:quizz_application/screens/splash_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = SplashScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        activeScreen = const QuestionScreen();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 60, 45, 137),
        body: Center(
          child: activeScreen,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
