import 'models.dart';

class BeginnerOSQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'An operating system is best described as:',
      choices: [
        'A hardware device installed inside the computer',
        'Software that manages hardware and enables applications to run',
        'A tool used only for gaming',
        'A program used for creating documents',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'One of the main functions of an operating system is:',
      choices: [
        'Designing web pages',
        'Scheduling processes and managing CPU time',
        'Connecting computers to social media',
        'Formatting USB drives automatically',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Memory management in an OS is responsible for:',
      choices: [
        'Controlling the monitor’s brightness',
        'Assigning and tracking memory used by programs',
        'Displaying icons on the desktop',
        'Installing third-party apps',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'File management includes:',
      choices: [
        'Designing folder icons',
        'Organizing, storing, and protecting files',
        'Creating new programming languages',
        'Managing website servers',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A multi-user operating system allows:',
      choices: [
        'Only one program to run at a time',
        'Multiple users to access system resources simultaneously',
        'Only one file to be stored',
        'The computer to run without electricity',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A Graphical User Interface (GUI):',
      choices: [
        'Requires typing commands only',
        'Uses windows, icons, and menus for interaction',
        'Works only on servers',
        'Cannot run applications',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A Command Line Interface (CLI):',
      choices: [
        'Is used only on mobile phones',
        'Requires command typing and offers high precision',
        'Cannot manage files',
        'Has no access to hardware',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'System calls allow:',
      choices: [
        'Applications to access hardware safely through the OS',
        'Users to shut down the computer',
        'Games to run faster',
        'Files to download automatically',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'The kernel of an operating system:',
      choices: [
        'Controls only the screen display',
        'Manages hardware, memory, and core OS functions',
        'Stores music files',
        'Repairs corrupted files',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Operating systems are important because they:',
      choices: [
        'Replace all hardware in a computer',
        'Make computing possible by managing resources and supporting applications',
        'Remove viruses automatically',
        'Make the internet faster',
      ],
      correctIndex: 1,
    ),
  ];
}
