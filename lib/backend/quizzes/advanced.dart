import 'models.dart';

class AdvancedWebDevQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'Which layers make up modern web application architecture?',
      choices: [
        'Frontend, Backend, Database',
        'HTML, CSS, JavaScript',
        'Browser, ISP, Modem',
        'URL, DNS, HTTPS',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'What is the primary purpose of REST?',
      choices: [
        'To style web pages',
        'To structure scalable, stateless API communication',
        'To encrypt server files',
        'To connect databases automatically',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which data format is most commonly used in REST APIs?',
      choices: ['CSV', 'JSON', 'PDF', 'YAML'],
      correctIndex: 1,
    ),

    QuizQuestion(
      question:
          'What mechanism enables JavaScript to perform asynchronous operations?',
      choices: [
        'The event loop',
        'CSS animations',
        'HTML rendering',
        'Browser history',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question:
          'Which async pattern improves readability for handling promises?',
      choices: ['Callbacks', 'async/await', 'Nested loops', 'iframes'],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What does HTTPS provide?',
      choices: [
        'Faster connection speed',
        'Encrypted communication between client and server',
        'Enhanced styling capabilities',
        'Automatic file backups',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What does authentication ensure?',
      choices: [
        'A user is allowed to perform specific actions',
        'A user\'s identity is verified',
        'Files load faster on the website',
        'Scripts run asynchronously',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'CORS is used to:',
      choices: [
        'Control cross-domain resource access',
        'Protect passwords in databases',
        'Format HTML responses',
        'Optimize images',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'In Git, what does a commit represent?',
      choices: [
        'A full backup of your OS',
        'A snapshot of the project at a specific point in time',
        'A server connection request',
        'An automated merge of branches',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question:
          'What is the benefit of separating front-end and back-end in architecture?',
      choices: [
        'Makes styling easier',
        'Improves modularity and scalability',
        'Removes need for APIs',
        'Eliminates JavaScript usage',
      ],
      correctIndex: 1,
    ),
  ];
}
