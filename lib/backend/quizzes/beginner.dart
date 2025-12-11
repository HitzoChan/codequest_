import 'models.dart';

class BeginnerIntegrativeProgrammingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Integrative programming is best defined as:',
      choices: [
        'Writing programs using only one language',
        'Combining multiple languages, tools, and technologies to build applications',
        'Using only hardware to perform tasks',
        'Creating programs with no external components',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The procedural programming paradigm focuses on:',
      choices: [
        'Objects and classes',
        'User-generated events',
        'Step-by-step instructions and functions',
        'Multimedia content only',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Object-oriented programming organizes code around:',
      choices: [
        'Randomly assigned variables',
        'Linear sequences of commands',
        'Objects that combine data and behavior',
        'Hardware specifications',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Event-driven programming is commonly used in:',
      choices: [
        'Server cooling systems',
        'Graphical user interfaces that respond to user actions',
        'Mathematical theory only',
        'Systems with no interaction',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The user interface in an integrated application is responsible for:',
      choices: [
        'Storing data permanently',
        'Handling processes behind the scenes',
        'Allowing users to interact with the software',
        'Managing network devices',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'The part of an integrated application that handles calculations and system decisions is the:',
      choices: [
        'User interface',
        'Application logic layer',
        'Storage hardware',
        'External network',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'APIs are used in software development because they:',
      choices: [
        'Prevent data from being transmitted',
        'Allow applications to communicate and access external services',
        'Replace all internal functions',
        'Are required only in gaming applications',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'External libraries help developers by:',
      choices: [
        'Forcing them to write all code manually',
        'Providing ready-made functions that simplify tasks',
        'Removing programming paradigms',
        'Eliminating the need for data formats',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'JSON and XML are commonly used because they:',
      choices: [
        'Are incompatible with most programming languages',
        'Provide standardized structures for exchanging data',
        'Can only be read by one specific system',
        'Replace the need for integration',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Software integration is important because it:',
      choices: [
        'Separates systems permanently',
        'Increases redundancy across programs',
        'Connects components so they function as one unified application',
        'Prevents systems from sharing information',
      ],
      correctIndex: 2,
    ),

  ];
}
