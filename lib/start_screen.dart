import 'package:flutter/material.dart';

import 'data/questions.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onStart});
  final VoidCallback onStart;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(28),
    child: Column(
      children: [
        const Icon(Icons.quiz_outlined, size: 100, color: Color(0xFFB5AAFF)),
        const SizedBox(height: 32),
        const Text(
          'Flutter Quiz',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'Otestuj svoje znalosti Flutteru.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 19),
        ),
        const SizedBox(height: 12),
        Text(
          '${questions.length} otázok • jedna správna odpoveď',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 40),
        FilledButton.icon(
          onPressed: onStart,
          icon: const Icon(Icons.arrow_forward),
          label: const Text('Start Quiz'),
        ),
      ],
    ),
  );
}
