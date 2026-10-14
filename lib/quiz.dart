import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'start_screen.dart';
import 'questions_screen.dart';
import 'results_screen.dart';

enum QuizScreen { start, questions, results }

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuizScreen _screen = QuizScreen.start;
  final List<String> _selectedAnswers = [];
  void _startQuiz() => setState(() {
    _selectedAnswers.clear();
    _screen = QuizScreen.questions;
  });
  void _chooseAnswer(String answer) => setState(() {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      _screen = QuizScreen.results;
    }
  });
  @override
  Widget build(BuildContext context) {
    final Widget screen = switch (_screen) {
      QuizScreen.start => StartScreen(onStart: _startQuiz),
      QuizScreen.questions => QuestionsScreen(onAnswer: _chooseAnswer),
      QuizScreen.results => ResultsScreen(
        selectedAnswers: List.unmodifiable(_selectedAnswers),
        onRestart: _startQuiz,
      ),
    };
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF30245C), Color(0xFF111326)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.white, fontSize: 16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: screen,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
