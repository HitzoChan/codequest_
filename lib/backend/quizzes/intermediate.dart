import 'models.dart';

class IntermediateNetworkingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'What is the main purpose of the OSI model?',
      choices: [
        'To design computer hardware',
        'To standardize how data travels in a network',
        'To create IP addresses',
        'To assign Wi-Fi passwords',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which OSI layer is responsible for routing data using IP addresses?',
      choices: [
        'Application',
        'Network',
        'Physical',
        'Session',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The TCP/IP model used in real-world networking has how many layers?',
      choices: [
        '2',
        '3',
        '4',
        '7',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which layer in TCP/IP includes protocols like HTTP and DNS?',
      choices: [
        'Application',
        'Transport',
        'Internet',
        'Network Access',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'What does an IPv4 address identify?',
      choices: [
        'Cable connector type',
        'Software version',
        'A device on a network',
        'Voltage level',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which of the following is a private IP address range?',
      choices: [
        '8.8.8.8',
        '172.16.0.1',
        '220.12.1.1',
        '1.1.1.1',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A subnet mask is used to determine:',
      choices: [
        'The MAC address',
        'Network and host portions of an IP',
        'Cable type',
        'Connection speed',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which device forwards data using MAC addresses?',
      choices: [
        'Router',
        'Switch',
        'Firewall',
        'Modem',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What does the “ping” command check?',
      choices: [
        'File size',
        'Internet speed',
        'Connectivity between devices',
        'Cable temperature',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A firewall’s main purpose is to:',
      choices: [
        'Print documents',
        'Filter network traffic',
        'Increase bandwidth',
        'Assign IP addresses',
      ],
      correctIndex: 1,
    ),

  ];
}
