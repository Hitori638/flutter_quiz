import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'models/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onAnswer});
  final ValueChanged<String> onAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _index = 0;
  late List<String> _answers;
  @override
  void initState() {
    super.initState();
    _answers = questions[_index].getShuffledAnswers();
  }

  void _answer(String answer) {
    widget.onAnswer(answer);
    if (_index < questions.length - 1) {
      setState(() {
        _index++;
        _answers = questions[_index].getShuffledAnswers();
      });
    }
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(Icons.auto_awesome, color: Color(0xFFB5AAFF)),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'FLUTTER QUIZ',
                style: TextStyle(letterSpacing: 2, color: Colors.white70),
              ),
            ),
            Text('${_index + 1} / ${questions.length}'),
          ],
        ),
        const SizedBox(height: 20),
        LinearProgressIndicator(
          value: (_index + 1) / questions.length,
          minHeight: 6,
          borderRadius: BorderRadius.circular(8),
        ),
        const SizedBox(height: 40),
        Text(
          'OTÁZKA ${_index + 1}',
          style: const TextStyle(color: Color(0xFFB5AAFF), letterSpacing: 2),
        ),
        const SizedBox(height: 16),
        Text(
          questions[_index].text,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          'Vyber jednu odpoveď.',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 28),
        ..._answers.map(
          (answer) =>
              AnswerButton(answer: answer, onTap: () => _answer(answer)),
        ),
      ],
    ),
  );
}
