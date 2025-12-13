import 'models.dart';

class IntermediateMobileDevQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'UI/UX design in mobile apps focuses on:',
      choices: [
        'Hardware compatibility',
        'Creating interfaces and experiences that are easy and enjoyable for users',
        'Writing low-level system code',
        'Increasing device battery usage',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Visual hierarchy in mobile design refers to:',
      choices: [
        'Arranging elements randomly',
        'Organizing interface elements to show importance and guide user attention',
        'Hiding all non-essential features',
        'Making all text the same size',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A tab bar or bottom navigation is most useful when:',
      choices: [
        'The app contains only one screen',
        'Users need quick access to several main sections',
        'The app has no user interface',
        'Users prefer text-only menus',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'SQLite in mobile development is used for:',
      choices: [
        'Rendering animations',
        'Local database storage',
        'Sending push notifications',
        'Testing device performance',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Shared Preferences is best used for storing:',
      choices: [
        'Large datasets',
        'Simple key-value pairs like settings or user preferences',
        'High-resolution images',
        'Complete user accounts',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'APIs allow mobile apps to:',
      choices: [
        'Connect with external services and retrieve data',
        'Change device hardware',
        'Automatically update the operating system',
        'Remove unused features',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'JSON is commonly used in API communication because it:',
      choices: [
        'Is readable by both humans and machines',
        'Only works on iOS',
        'Stores images efficiently',
        'Requires no structure',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Asynchronous operations help apps by:',
      choices: [
        'Freezing the interface during tasks',
        'Running long operations without blocking the UI',
        'Reducing app security',
        'Preventing data storage',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A callback is:',
      choices: [
        'A function executed after an asynchronous operation completes',
        'An error caused by network failure',
        'A tool for deleting stored data',
        'A built-in database engine',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'API integration is important because:',
      choices: [
        'Most apps run without internet access',
        'It allows apps to access real-time or external information',
        'It removes the need for UI design',
        'It disables offline features',
      ],
      correctIndex: 1,
    ),

  ];
}
