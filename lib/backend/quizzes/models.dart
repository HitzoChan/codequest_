class QuizQuestion {
  final String question;
  final List<String> choices;
  final int correctIndex;

  QuizQuestion({
    required this.question,
    required this.choices,
    required this.correctIndex,
  });
}
