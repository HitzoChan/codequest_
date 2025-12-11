import 'models.dart';

class IntermediateIntegrativeProgrammingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Programming integration techniques are important because they:',
      choices: [
        'Limit applications to one language only',
        'Allow different technologies to work together within an application',
        'Prevent systems from sharing data',
        'Remove the need for a database',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Scripting languages such as Python or JavaScript help integration by:',
      choices: [
        'Replacing all compiled languages',
        'Automating tasks and connecting components',
        'Removing the need for APIs',
        'Preventing background processes',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A key advantage of automation in integration is that it:',
      choices: [
        'Increases manual operations',
        'Introduces more repeated errors',
        'Reduces errors and ensures consistency',
        'Eliminates system logic',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'RESTful APIs commonly use:',
      choices: [
        'Messaging queues',
        'Hexadecimal encoding only',
        'Standard HTTP methods for communication',
        'Only binary data formats',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'JSON and XML are used in integration because they:',
      choices: [
        'Are incompatible with modern programming languages',
        'Provide structured and widely accepted data formats',
        'Replace the need for scripting',
        'Only work in desktop applications',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Asynchronous messaging allows systems to:',
      choices: [
        'Communicate only when both parties are online',
        'Exchange data without requiring simultaneous availability',
        'Remove middleware layers',
        'Always produce immediate responses',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Middleware is best described as:',
      choices: [
        'A hardware device for storing backups',
        'Software that enables communication between independent systems',
        'A programming language for GUI design',
        'A type of optical storage',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'API gateways help integration by:',
      choices: [
        'Limiting access to only one user',
        'Managing and securing access to multiple APIs',
        'Replacing all application servers',
        'Storing database records',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'SOAP web services are typically used when:',
      choices: [
        'Only lightweight communication is needed',
        'Security and strict communication rules are required',
        'Data must always be sent in JSON format',
        'Systems operate without networks',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Effective error handling in integration ensures that systems:',
      choices: [
        'Fail completely when issues occur',
        'Respond unpredictably to communication problems',
        'Detect, log, and recover from failures',
        'Ignore communication failures',
      ],
      correctIndex: 2,
    ),

  ];
}
