import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestart,
  });
  final List<String> selectedAnswers;
  final VoidCallback onRestart;
  List<QuestionResult> get summary => selectedAnswers
      .asMap()
      .entries
      .map(
        (entry) => QuestionResult(
          index: entry.key,
          question: questions[entry.key].text,
          selectedAnswer: entry.value,
          correctAnswer: questions[entry.key].correctAnswer,
        ),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    final results = summary;
    final correct = results.where((item) => item.isCorrect).length;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Icon(
            Icons.emoji_events_outlined,
            size: 48,
            color: Color(0xFFB5AAFF),
          ),
          const SizedBox(height: 12),
          const Text(
            'Tvoje výsledky',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '$correct / ${questions.length} správnych • ${(correct / questions.length * 100).round()} %',
            style: const TextStyle(fontSize: 18, color: Color(0xFFB5AAFF)),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: QuestionsSummary(summary: results),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: onRestart,
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
