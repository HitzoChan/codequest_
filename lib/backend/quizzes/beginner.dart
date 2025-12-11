import 'models.dart';

class BeginnerCSSQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Computer Systems Servicing primarily involves:',
      choices: [
        'Designing software applications',
        'Maintaining, repairing, and configuring computer hardware and peripherals',
        'Creating video game graphics',
        'Operating social media applications',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The CPU (Central Processing Unit) is best described as:',
      choices: [
        'A device for storing long-term files',
        'The component that executes instructions and processes data',
        'A backup power source',
        'A type of external peripheral',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'RAM (Random Access Memory) is used to:',
      choices: [
        'Store temporary data needed while programs are running',
        'Store files permanently',
        'Display output to the user',
        'Control the power supply',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Which of the following is an example of an input device?',
      choices: [
        'Monitor',
        'Printer',
        'Keyboard',
        'Speaker',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'An anti-static wrist strap is used to:',
      choices: [
        'Increase computer speed',
        'Prevent electrostatic discharge from damaging components',
        'Secure cables inside the system',
        'Test network connectivity',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Before opening a computer system for servicing, the technician should:',
      choices: [
        'Install new software',
        'Disconnect the power source',
        'Increase screen brightness',
        'Remove all peripherals',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A cable tester is used to:',
      choices: [
        'Measure CPU temperature',
        'Test whether network cables are functioning correctly',
        'Install software drivers',
        'Clean internal components',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Preventive maintenance is important because it:',
      choices: [
        'Makes the computer run slower',
        'Prevents overheating, reduces failures, and extends hardware lifespan',
        'Requires replacing components frequently',
        'Eliminates the need for safety procedures',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Cleaning dust from computer components helps prevent:',
      choices: [
        'Faster boot time',
        'System overheating and hardware damage',
        'Software errors',
        'The need for peripherals',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Device drivers are needed because they:',
      choices: [
        'Store user files',
        'Allow the operating system to communicate with hardware devices',
        'Replace the BIOS settings',
        'Remove viruses from the computer',
      ],
      correctIndex: 1,
    ),

  ];
}
