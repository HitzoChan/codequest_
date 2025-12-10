import 'models.dart';

class AdvancedNetworkingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Which layer of enterprise architecture provides high-speed backbone connectivity?',
      choices: [
        'Access Layer',
        'Core Layer',
        'Firewall Layer',
        'User Layer',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A routing table contains:',
      choices: [
        'Only MAC addresses',
        'Destination networks and next hops',
        'Wi-Fi passwords',
        'Usernames and IDs',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Static routing is best described as:',
      choices: [
        'Routes learned automatically',
        'Manually configured routes',
        'Wireless routing only',
        'Routes used by switches',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which routing protocol uses hop count as its metric?',
      choices: [
        'OSPF',
        'BGP',
        'RIP',
        'VLAN',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'OSPF is known as a:',
      choices: [
        'Link-state protocol',
        'Distance-vector protocol',
        'Path-vector protocol',
        'Static protocol',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'BGP is primarily used for:',
      choices: [
        'Small home networks',
        'Connecting devices via Bluetooth',
        'Routing between large networks and ISPs',
        'Managing VLAN traffic',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'What is the purpose of VLANs?',
      choices: [
        'Increase Wi-Fi speed',
        'Physically separate networks',
        'Logically divide networks for security and efficiency',
        'Replace routers',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'ACLs are used to:',
      choices: [
        'Save files',
        'Control network traffic by allowing or denying packets',
        'Test internet speed',
        'Install applications',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A VPN mainly provides:',
      choices: [
        'Faster browsing',
        'Gaming performance',
        'Encrypted remote access',
        'DHCP services',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which WAN technology is commonly used for long-distance, high-speed connections?',
      choices: [
        'Ethernet',
        'Fiber Optic Links',
        'USB cables',
        'HDMI',
      ],
      correctIndex: 1,
    ),

  ];
}
