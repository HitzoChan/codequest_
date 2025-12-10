import 'models.dart';

class IntermediateIntroComputingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'A computer system functions effectively because:',
      choices: [
        'Only the hardware operates independently',
        'Hardware, software, people, and processes work together',
        'It performs tasks without any operating system',
        'It requires no interaction between components',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The operating system acts as:',
      choices: [
        'A physical storage device',
        'A bridge between hardware, software, and users',
        'A replacement for applications',
        'A tool used only for entertainment',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'One major role of an operating system is to:',
      choices: [
        'Restrict all forms of multitasking',
        'Control how programs use hardware resources',
        'Replace the central processing unit',
        'Remove unused files automatically',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which type of operating system is designed for personal computers used in everyday tasks?',
      choices: [
        'Mobile OS',
        'Desktop OS',
        'Server OS',
        'Embedded OS',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Mobile operating systems such as Android and iOS are designed to:',
      choices: [
        'Support touch-based interfaces and manage device power efficiently',
        'Run multiple servers at the same time',
        'Replace desktop operating systems entirely',
        'Function only with external storage',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Software installation involves:',
      choices: [
        'Removing all existing applications from a device',
        'Allocating resources and integrating the program into the system',
        'Copying data without configuration',
        'Disabling system updates',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Updating software is important because it:',
      choices: [
        'Removes all saved files',
        'Downgrades security features',
        'Provides improvements, bug fixes, and security patches',
        'Makes the software consume more storage',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'File management allows users to:',
      choices: [
        'Manipulate the CPU speed',
        'Organize, store, and retrieve digital files efficiently',
        'Modify hardware components',
        'Operate the device without an operating system',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Storage devices such as SSDs and cloud services help users:',
      choices: [
        'Connect to wireless networks',
        'Store data for long-term access',
        'Execute arithmetic calculations',
        'Monitor energy consumption',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'User accounts and permissions are essential because they:',
      choices: [
        'Allow all users to access everything freely',
        'Prevent system logs from recording activity',
        'Protect system settings and user data from unauthorized access',
        'Disable security features for convenience',
      ],
      correctIndex: 2,
    ),

  ];
}
