import 'models.dart';

class IntermediateSysIntQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'System architecture models are used because they:',
      choices: [
        'Increase system complexity',
        'Provide structured ways to design and organize system components',
        'Remove the need for data processing',
        'Focus only on hardware design',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The main purpose of layered architecture is to:',
      choices: [
        'Combine all system functions into one layer',
        'Allow each layer to handle specific responsibilities independently',
        'Eliminate the need for data storage',
        'Replace middleware in system integration',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'In a typical layered architecture, the presentation layer is responsible for:',
      choices: [
        'Applying business rules',
        'Managing databases',
        'Handling user interactions and interface tasks',
        'Authenticating middleware connections',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Client–server architecture relies on:',
      choices: [
        'Servers sending requests to clients',
        'Clients requesting services while servers process and store data',
        'Direct device-to-device communication without servers',
        'Systems operating without networks',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A key advantage of client–server systems is that they:',
      choices: [
        'Require each user to manage their own local data',
        'Prevent centralized management',
        'Allow updates and security to be managed from a single point',
        'Eliminate communication between applications',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Middleware acts as:',
      choices: [
        'A replacement for all network devices',
        'Software that enables communication between separate systems',
        'Hardware that stores backup copies of data',
        'A direct substitute for operating systems',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'APIs support integration by:',
      choices: [
        'Allowing applications to exchange data using defined rules',
        'Preventing communication between systems',
        'Replacing all middleware functions',
        'Eliminating the need for security measures',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'One benefit of using APIs is that they:',
      choices: [
        'Make systems incompatible with each other',
        'Limit the number of applications that can communicate',
        'Promote reusability across different software solutions',
        'Require all applications to use the same programming language',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Data flow diagrams are used to:',
      choices: [
        'Visualize how information moves across an integrated system',
        'Replace system architecture models',
        'Measure the physical speed of a processor',
        'Test the durability of hardware',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Understanding data flow in integrated systems is important because it:',
      choices: [
        'Increases processing errors',
        'Helps ensure data is managed accurately and consistently',
        'Prevents communication between components',
        'Removes the need for system documentation',
      ],
      correctIndex: 1,
    ),

  ];
}
