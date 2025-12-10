import 'models.dart';

class IntermediateWebDevQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'In the client–server model, the client’s role is to:',
      choices: [
        'Store databases',
        'Request and display web content',
        'Build HTML files',
        'Monitor server temperature',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which part of a website stores and serves its files?',
      choices: [
        'Browser',
        'Server',
        'Router',
        'DOM',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What is the main difference between HTTP and HTTPS?',
      choices: [
        'HTTPS loads slower',
        'HTTPS uses encryption for security',
        'HTTP cannot load images',
        'HTTP is newer',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The DOM is created by the browser to:',
      choices: [
        'Store passwords',
        'Represent the structure of the webpage as a tree',
        'Compress images',
        'Increase server speed',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which language interacts directly with the DOM?',
      choices: [
        'CSS',
        'JavaScript',
        'SQL',
        'PHP',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Responsive design is important because it:',
      choices: [
        'Makes photos clearer',
        'Ensures websites adjust to different screen sizes',
        'Adds security to websites',
        'Improves WiFi connectivity',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Media queries are used in which technology?',
      choices: [
        'HTML',
        'CSS',
        'Java',
        'Python',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A static website is best described as a site that:',
      choices: [
        'Updates automatically',
        'Uses a database for user content',
        'Shows fixed content unless manually changed',
        'Requires login',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Dynamic websites depend on:',
      choices: [
        'Only JavaScript',
        'Browser settings',
        'Server-side scripts and databases',
        'HTML comments',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which of the following is an example of a dynamic website?',
      choices: [
        'A simple text-only homepage',
        'A static portfolio website',
        'A social media platform with user accounts',
        'A printed newspaper',
      ],
      correctIndex: 2,
    ),

  ];
}
