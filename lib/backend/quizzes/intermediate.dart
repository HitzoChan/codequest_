import 'models.dart';

class IntermediateCSSQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'System configuration is important because it:',
      choices: [
        'Ensures hardware and software function together efficiently',
        'Replaces the need for operating systems',
        'Prevents users from changing settings',
        'Removes all system drivers automatically',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'The primary function of BIOS/UEFI is to:',
      choices: [
        'Monitor internet performance',
        'Initialize hardware and prepare the system to boot',
        'Store user documents',
        'Edit system applications',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'One advantage of UEFI over BIOS is that it:',
      choices: [
        'Supports only small storage drives',
        'Boots slower than BIOS',
        'Supports larger disks and provides more advanced security',
        'Does not allow hardware diagnostics',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Disk partitioning is used to:',
      choices: [
        'Reduce RAM usage',
        'Divide a storage drive into separate sections for organization',
        'Increase processor speed',
        'Remove the need for a file system',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A file system determines:',
      choices: [
        'How the CPU executes instructions',
        'How files are stored, accessed, and organized on a partition',
        'How monitors display images',
        'How RAM is installed in the motherboard',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'After installing an operating system, a technician must:',
      choices: [
        'Immediately delete system files',
        'Install drivers and configure system settings',
        'Disable all security features',
        'Avoid applying updates',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Diagnostic tools are used to:',
      choices: [
        'Test hardware and software functionality',
        'Remove all user accounts',
        'Increase file size',
        'Edit website code',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'A structured troubleshooting process typically begins with:',
      choices: [
        'Replacing all hardware components',
        'Identifying the problem and gathering information',
        'Formatting the entire drive',
        'Installing a new operating system',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'System optimization includes tasks such as:',
      choices: [
        'Adding unnecessary startup programs',
        'Filling the storage drive completely',
        'Updating drivers and removing temporary files',
        'Blocking all system updates',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A technician who can configure BIOS, create partitions, install OS software, and troubleshoot issues is demonstrating:',
      choices: [
        'Beginner-level CSS skills',
        'Intermediate CSS competencies',
        'Networking administration skills only',
        'Advanced software development',
      ],
      correctIndex: 1,
    ),

  ];
}
