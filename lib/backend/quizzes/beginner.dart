import 'models.dart';

class BeginnerCloudComputingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Cloud computing allows users to access computing resources through:',
      choices: [
        'Local hardware only',
        'The internet',
        'Physical storage devices',
        'Offline applications',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'One major benefit of cloud computing is that it:',
      choices: [
        'Requires installing all software manually',
        'Eliminates all security requirements',
        'Allows users to pay only for the resources they consume',
        'Works only on desktop computers',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which characteristic of cloud computing allows users to access services anytime without IT assistance?',
      choices: [
        'Resource pooling',
        'On-demand self-service',
        'Hybrid networking',
        'Data encryption',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A public cloud is best described as:',
      choices: [
        'A cloud environment used by only one organization',
        'A cloud service hosted locally on personal hardware',
        'A shared environment provided by third-party companies',
        'A private backup storage device',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which deployment model combines public and private cloud features?',
      choices: [
        'Local cloud',
        'Distributed cloud',
        'Hybrid cloud',
        'Exclusive cloud',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Infrastructure as a Service (IaaS) provides users with:',
      choices: [
        'Fully developed software applications',
        'A virtualized computing environment such as storage and servers',
        'Only email and messaging tools',
        'Pre-built gaming engines',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which service model is used when accessing applications through a web browser without installation?',
      choices: [
        'IaaS',
        'PaaS',
        'SaaS',
        'NaaS',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A private cloud is often chosen because it offers:',
      choices: [
        'Shared access with all users on the internet',
        'No maintenance and no customization',
        'Greater control and enhanced security',
        'Free unlimited storage',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Cloud computing supports collaboration because it:',
      choices: [
        'Restricts file sharing',
        'Allows users to access shared files from anywhere',
        'Requires users to work on the same device',
        'Limits communication tools',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following is a common real-world use of cloud computing?',
      choices: [
        'Manual filing systems',
        'Paper-based communication',
        'Streaming services and online storage',
        'Analog telephone systems',
      ],
      correctIndex: 2,
    ),

  ];
}
