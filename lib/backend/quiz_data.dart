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

class SqlIntroQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'What does SQL stand for?',
      choices: ['Simple Query Language', 'Structured Query Language', 'System Query List', 'Single Query Logic'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'SQL is mainly used for:',
      choices: ['Designing UI', 'Storing and managing data', 'Building mobile apps', 'Drawing graphics'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Which SQL keyword retrieves data?',
      choices: ['INSERT', 'UPDATE', 'SELECT', 'DELETE'],
      correctIndex: 2,
    ),
    QuizQuestion(
      question: 'Which SQL statement adds new data?',
      choices: ['ADD', 'INSERT', 'PUT', 'APPEND'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'What does the WHERE clause do?',
      choices: ['Sorts data', 'Filters data', 'Deletes all data', 'Groups data'],
      correctIndex: 1,
    ),
  ];
}