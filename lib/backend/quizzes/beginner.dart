import 'models.dart';

class WebDevPdfQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'What is the primary purpose of web development?',
      choices: [
        'To create and maintain websites and online systems',
        'To design physical computer components',
        'To build mobile hardware',
        'To install operating systems',
      ],
      correctIndex: 0,
    ),
    QuizQuestion(
      question: 'Which technology provides the structure of a webpage?',
      choices: [
        'CSS',
        'JavaScript',
        'HTML',
        'Python',
      ],
      correctIndex: 2,
    ),
    QuizQuestion(
      question: 'What role does CSS play in a website?',
      choices: [
        'Provides structure to the webpage',
        'Adds visual design and layout',
        'Handles server responses',
        'Manages databases',
      ],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Which of the following adds interactivity to a webpage?',
      choices: [
        'HTML',
        'CSS',
        'JavaScript',
        'SQL',
      ],
      correctIndex: 2,
    ),
    QuizQuestion(
      question: 'What does a browser do when you enter a URL?',
      choices: [
        'Creates a new HTML file',
        'Sends a request to a web server',
        'Designs the webpage automatically',
        'Stores user database records',
      ],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Which of the following stores website files and responds to browser requests?',
      choices: [
        'Web server',
        'Router',
        'CSS engine',
        'Compiler',
      ],
      correctIndex: 0,
    ),
    QuizQuestion(
      question: 'Static websites are described as:',
      choices: [
        'Automatically updating content based on databases',
        'Fixed content that only changes when updated manually',
        'Websites that require no HTML at all',
        'Websites designed only for mobile devices',
      ],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Dynamic websites typically use which component?',
      choices: [
        'Only HTML and CSS',
        'Databases and server-side scripts',
        'Plain text files',
        'Static hosting only',
      ],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Which tool is essential for writing and organizing web development code?',
      choices: [
        'Printer',
        'Code Editor (e.g., VS Code)',
        'Monitor',
        'Firewall',
      ],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Why is web development important today?',
      choices: [
        'It replaces traditional computer hardware',
        'It supports digital communication, services, and business processes',
        'It is only used for entertainment websites',
        'It eliminates the need for programming skills',
      ],
      correctIndex: 1,
    ),
  ];
}
