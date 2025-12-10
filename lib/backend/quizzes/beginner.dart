import 'models.dart';

class BeginnerNetworkingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'What is a computer network?',
      choices: [
        'A collection of websites',
        'A group of devices connected to share resources',
        'A single computer used for storage',
        'A program used to surf the internet',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which device connects multiple devices within a LAN?',
      choices: [
        'Modem',
        'Switch',
        'Printer',
        'USB cable',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What does a router do?',
      choices: [
        'Prints documents',
        'Connects networks and directs data',
        'Stores user files',
        'Repairs cables',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which medium uses wireless signals?',
      choices: [
        'Ethernet cable',
        'Wi-Fi',
        'Fiber wire',
        'Copper pipe',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A network that covers a small area like a home or office is called:',
      choices: [
        'WAN',
        'MAN',
        'LAN',
        'TAN',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'The internet is an example of what type of network?',
      choices: [
        'LAN',
        'MAN',
        'WAN',
        'PAN',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'In which topology do all devices connect to a central device?',
      choices: [
        'Ring',
        'Bus',
        'Star',
        'Mesh',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A hub sends data to:',
      choices: [
        'Only the correct device',
        'All connected devices',
        'Wireless devices only',
        'The router only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Full-duplex communication allows:',
      choices: [
        'One-way communication',
        'Two-way communication but not simultaneously',
        'Both devices to send and receive at the same time',
        'Wireless communication only',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which device connects the network to the internet?',
      choices: [
        'Hub',
        'Modem',
        'Switch',
        'Printer',
      ],
      correctIndex: 1,
    ),

  ];
}
