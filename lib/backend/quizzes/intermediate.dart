import 'models.dart';

class IntermediateWebDevQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'What is the primary role of the client in the client–server model?',
      choices: [
        'Store website files',
        'Send requests to the server and display responses',
        'Encrypt all data on the internet',
        'Manage global DNS records',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which protocol encrypts data transmitted between client and server?',
      choices: [
        'HTTP',
        'FTP',
        'HTTPS',
        'UDP',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'What is the Document Object Model (DOM)?',
      choices: [
        'A debugging tool used by web browsers',
        'A tree-like structure representing the elements of a webpage',
        'A protocol for sending web requests',
        'A layout system for mobile devices',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What allows JavaScript to update webpage content without reloading the page?',
      choices: [
        'HTTP requests',
        'CSS animations',
        'DOM manipulation',
        'File compression',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which CSS feature is essential for responsive web design?',
      choices: [
        'Keyframes',
        'Media queries',
        'Transforms',
        'Pseudo-classes',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Responsive design ensures that a website:',
      choices: [
        'Uses only HTML and CSS',
        'Looks and functions well on different device sizes',
        'Loads without JavaScript',
        'Can only be viewed on mobile devices',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Static websites:',
      choices: [
        'Generate content automatically',
        'Contain fixed content unless manually updated',
        'Require databases to function',
        'Are always built with JavaScript frameworks',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Dynamic websites typically rely on:',
      choices: [
        'Flat HTML files only',
        'CSS variables',
        'Server-side scripts and databases',
        'Local storage only',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which protocol is used when entering a website URL in a browser?',
      choices: [
        'HTTPS or HTTP',
        'SMTP',
        'SSH',
        'WebSocket',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Why is understanding the client–server model important?',
      choices: [
        'It explains how images load in Photoshop',
        'It shows how browsers and servers communicate to deliver webpages',
        'It is required only for networking professionals',
        'It helps design offline desktop applications',
      ],
      correctIndex: 1,
    ),

  ];
}
