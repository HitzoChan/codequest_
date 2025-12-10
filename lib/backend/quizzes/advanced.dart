import 'models.dart';

class AdvancedWebDevQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'What is the main purpose of an API in a web application?',
      choices: [
        'To design the interface',
        'To allow communication between software components',
        'To store images',
        'To speed up WiFi',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which format is commonly used by REST APIs to exchange data?',
      choices: [
        'JPEG',
        'PDF',
        'JSON',
        'MP3',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'What is the role of the event loop in JavaScript?',
      choices: [
        'To design the layout',
        'To manage asynchronous operations',
        'To store website files',
        'To optimize images',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What HTTP method is typically used to send data to a server?',
      choices: [
        'GET',
        'POST',
        'DELETE',
        'PRINT',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following represents a database used in web development?',
      choices: [
        'Chrome',
        'MySQL',
        'Git',
        'HTML',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Authentication refers to:',
      choices: [
        'Giving permissions',
        'Identifying a user',
        'Encrypting a file',
        'Loading animations',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Authorization is the process of:',
      choices: [
        'Confirming identity',
        'Determining access rights',
        'Creating an account',
        'Storing data',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'CORS is used to:',
      choices: [
        'Improve website design',
        'Prevent unauthorized cross-domain access',
        'Make pages load faster',
        'Compress files',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which Git action stores a snapshot of changes?',
      choices: [
        'Merge',
        'Commit',
        'Clone',
        'Pull',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A full-stack application uses:',
      choices: [
        'Only front-end',
        'Only back-end',
        'Both front-end and back-end',
        'Neither layer',
      ],
      correctIndex: 2,
    ),

  ];
}
