import 'models.dart';

class AdvancedMobileDevQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Mobile application architecture patterns such as MVC and MVVM help developers by:',
      choices: [
        'Increasing device storage space',
        'Organizing code into clear layers for easier maintenance and testing',
        'Guaranteeing faster internet speeds',
        'Automatically generating app designs',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Clean Architecture is characterized by:',
      choices: [
        'Keeping all logic inside one file',
        'Clear separation between UI, business logic, and data layers',
        'Allowing UI elements direct access to databases',
        'Eliminating the need for testing',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A common method for identifying performance issues in mobile apps is:',
      choices: [
        'Using profiling tools provided by Android Studio or Xcode',
        'Guessing based on user reports',
        'Restarting the app repeatedly',
        'Disabling animations',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Memory leaks in mobile applications occur when:',
      choices: [
        'An app stores too many images',
        'Memory is allocated but not properly released',
        'The device has low storage space',
        'The app uses a dark theme',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Secure API communication often requires:',
      choices: [
        'Sending data without encryption',
        'Using HTTPS and proper authentication tokens',
        'Removing user verification',
        'Avoiding server communication completely',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following is a secure coding practice?',
      choices: [
        'Accepting all user input without validation',
        'Storing passwords in plain text',
        'Encrypting sensitive data stored on the device',
        'Ignoring outdated libraries',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Backend integration allows mobile apps to:',
      choices: [
        'Run offline-only applications',
        'Communicate with servers and synchronize user data',
        'Remove the need for mobile UI',
        'Replace local storage entirely',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Unit testing in mobile applications focuses on:',
      choices: [
        'Testing entire user flows',
        'Verifying individual functions or components',
        'Simulating app deployment',
        'Checking app store compliance',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'UI testing is important because it:',
      choices: [
        'Ensures that buttons, screens, and navigation behave correctly',
        'Replaces backend services',
        'Automatically fixes performance issues',
        'Tests the speed of cloud servers',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Deployment to the Google Play Store or Apple App Store typically requires:',
      choices: [
        'Publishing without any review',
        'Meeting platform guidelines, providing screenshots, and completing app metadata',
        'Uploading only the source code',
        'Removing all security features',
      ],
      correctIndex: 1,
    ),

  ];
}
