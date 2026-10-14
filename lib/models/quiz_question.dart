class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  // First answer is correct. Shuffle a copy, keeping source data intact.
  final List<String> answers;
  String get correctAnswer => answers.first;
  List<String> getShuffledAnswers() => List<String>.of(answers)..shuffle();
}
