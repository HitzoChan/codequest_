import 'models.dart';

class BeginnerMobileDevQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Mobile application development refers to:',
      choices: [
        'Designing websites for desktop computers',
        'Creating software applications for smartphones and tablets',
        'Installing hardware components',
        'Writing programs for servers only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Android and iOS are examples of:',
      choices: [
        'Database systems',
        'Mobile operating platforms',
        'Programming languages',
        'Web browsers',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A native mobile application is one that:',
      choices: [
        'Runs only in a web browser',
        'Is developed specifically for one platform (Android or iOS)',
        'Cannot access device features',
        'Works without any coding',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Cross-platform applications are designed to:',
      choices: [
        'Run on multiple mobile platforms using shared code',
        'Work only on high-end devices',
        'Replace native applications entirely',
        'Operate only offline',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'The user interface layer of a mobile app is responsible for:',
      choices: [
        'Managing the device hardware',
        'Displaying layouts, buttons, and interactive elements',
        'Connecting directly to remote databases',
        'Testing network performance',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The logic layer of a mobile app:',
      choices: [
        'Controls how the app behaves and processes data',
        'Changes device screen brightness',
        'Stores user passwords permanently',
        'Displays advertisements only',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Android Studio is the official development tool for:',
      choices: [
        'iOS',
        'Android',
        'Web applications',
        'Desktop games',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The main programming language for iOS development is:',
      choices: [
        'Java',
        'Kotlin',
        'Swift',
        'C#',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'APIs in mobile applications are used to:',
      choices: [
        'Control phone brightness',
        'Communicate with external servers or services',
        'Uninstall unused apps',
        'Format the device memory',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Mobile application development is important because:',
      choices: [
        'Mobile devices are rarely used today',
        'Apps allow users to access services and information on the go',
        'Only companies benefit from apps',
        'It replaces all forms of web development',
      ],
      correctIndex: 1,
    ),

  ];
}
