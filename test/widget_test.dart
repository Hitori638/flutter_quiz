import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/main.dart' as app;
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/answer_button.dart';

void main() {
  test('Shuffle preserves the correct answer and every option', () {
    for (final q in questions) {
      expect(q.getShuffledAnswers(), unorderedEquals(q.answers));
      expect(q.correctAnswer, q.answers.first);
    }
  });
  testWidgets('Mixed score, automatic progression and clean restart', (
    tester,
  ) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.byType(Quiz), findsOneWidget);
    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();
    for (var i = 0; i < questions.length; i++) {
      expect(find.text(questions[i].text), findsOneWidget);
      expect(find.byType(AnswerButton), findsNWidgets(4));
      final answer = i.isEven
          ? questions[i].correctAnswer
          : questions[i].answers[1];
      final button = find.widgetWithText(OutlinedButton, answer);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pumpAndSettle();
    }
    expect(find.text('3 / 6 správnych • 50 %'), findsOneWidget);
    await tester.tap(find.text('Restart Quiz'));
    await tester.pumpAndSettle();
    for (final q in questions) {
      final button = find.widgetWithText(OutlinedButton, q.correctAnswer);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pumpAndSettle();
    }
    expect(find.text('6 / 6 správnych • 100 %'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
