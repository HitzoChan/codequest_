import 'models.dart';

class BeginnerWebDevQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'What is the main purpose of web development?',
      choices: [
        'To build and maintain websites',
        'To design computer hardware',
        'To install mobile apps',
        'To fix printers',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Which of the following is used for structuring a webpage?',
      choices: [
        'CSS',
        'JavaScript',
        'HTML',
        'SQL',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'What is the role of CSS in web development?',
      choices: [
        'To add interactivity',
        'To store user data',
        'To add design and layout',
        'To process server requests',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which technology allows a webpage to react to user actions?',
      choices: [
        'JavaScript',
        'HTML',
        'Database',
        'Web Server',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'What does the browser do when you open a website?',
      choices: [
        'Designs the webpage',
        'Sends requests and displays the webpage',
        'Stores user passwords',
        'Creates new HTML files',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A web server is responsible for…',
      choices: [
        'Writing code',
        'Designing images',
        'Storing and delivering website files',
        'Running animations',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which type of website displays fixed content unless manually updated?',
      choices: [
        'Dynamic',
        'Static',
        'Full-stack',
        'Responsive',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Dynamic websites use which component to change and update content?',
      choices: [
        'Mouse and keyboard',
        'Databases and server-side scripts',
        'HTML only',
        'CSS animations',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which tool is used to write the code for HTML, CSS, and JavaScript?',
      choices: [
        'Code editor',
        'Router',
        'Web server',
        'Printer',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'What is the benefit of using developer tools in the browser?',
      choices: [
        'To play games',
        'To debug and inspect webpage elements',
        'To increase WiFi speed',
        'To save power',
      ],
      correctIndex: 1,
    ),

  ];
}
