import 'package:flutter/material.dart';

class QuestionResult {
  const QuestionResult({
    required this.index,
    required this.question,
    required this.selectedAnswer,
    required this.correctAnswer,
  });
  final int index;
  final String question;
  final String selectedAnswer;
  final String correctAnswer;
  bool get isCorrect => selectedAnswer == correctAnswer;
}

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summary});
  final List<QuestionResult> summary;
  @override
  Widget build(BuildContext context) => Column(
    children: summary.map((item) {
      final color = item.isCorrect
          ? const Color(0xFF81E2B4)
          : const Color(0xFFFFA7B1);
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color,
              foregroundColor: const Color(0xFF111326),
              child: Text('${item.index + 1}'),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.question,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Tvoja odpoveď: ${item.selectedAnswer}',
                    style: TextStyle(color: color),
                  ),
                  if (!item.isCorrect)
                    Text(
                      'Správne: ${item.correctAnswer}',
                      style: const TextStyle(color: Color(0xFF81E2B4)),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}
