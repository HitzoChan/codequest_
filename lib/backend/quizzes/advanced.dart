import 'models.dart';

class AdvancedCSSQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Advanced hardware diagnostics require technicians to:',
      choices: [
        'Rely only on basic visual inspection',
        'Use specialized tools to identify deeper component issues',
        'Replace all parts without testing',
        'Avoid using diagnostic software',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A POST card analyzer is used to:',
      choices: [
        'Improve Wi-Fi signal strength',
        'Display diagnostic codes during system startup',
        'Clean dust from components',
        'Format storage drives',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'When upgrading a CPU, the technician must first evaluate:',
      choices: [
        'The number of USB ports available',
        'Whether the motherboard socket and chipset support the processor',
        'The color of the heatsink',
        'The size of the computer case',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Network troubleshooting often begins with:',
      choices: [
        'Replacing the motherboard',
        'Checking IP settings and basic connectivity',
        'Formatting the storage drive',
        'Uninstalling all drivers',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A DNS configuration problem typically causes:',
      choices: [
        'Inability to access websites by name',
        'Overheating of internal components',
        'Failure of the BIOS to load',
        'The keyboard to stop responding',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Implementing system security includes tasks such as:',
      choices: [
        'Disabling all updates permanently',
        'Installing antivirus software and configuring firewalls',
        'Removing all system passwords',
        'Allowing unrestricted user access',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'BIOS/UEFI password protection is used to:',
      choices: [
        'Slow down system performance',
        'Prevent unauthorized access to firmware settings',
        'Remove malware from the system',
        'Delete partitions automatically',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Encryption helps secure a system by:',
      choices: [
        'Increasing CPU temperature',
        'Converting data into unreadable form without a key',
        'Deleting all user files',
        'Blocking all network traffic',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Preventive maintenance documentation is important because it:',
      choices: [
        'Makes systems last longer without checks',
        'Tracks maintenance activities and recurring issues',
        'Replaces the need for diagnostics',
        'Prevents all hardware failures permanently',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A well-planned preventive maintenance schedule should:',
      choices: [
        'Be performed only when errors occur',
        'Include routine inspections, updates, and cleaning',
        'Ignore environmental conditions',
        'Only apply to software components',
      ],
      correctIndex: 1,
    ),

  ];
}
