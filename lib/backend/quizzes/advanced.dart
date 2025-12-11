import 'models.dart';

class AdvancedCloudComputingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Advanced cloud architecture places strong emphasis on:',
      choices: [
        'Removing redundancy',
        'Building scalable and resilient systems',
        'Using only local servers',
        'Eliminating automation',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Microservices are used in cloud architecture to:',
      choices: [
        'Combine all application functions into one large component',
        'Allow independent components to be updated or scaled separately',
        'Prevent applications from communicating',
        'Increase dependency among services',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Containerization is beneficial because it:',
      choices: [
        'Requires its own operating system for each application',
        'Makes applications heavier and slower',
        'Packages applications with their dependencies for consistency',
        'Prevents applications from running on different machines',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Unlike virtual machines, containers:',
      choices: [
        'Run on separate kernels',
        'Share the host operating system',
        'Cannot be moved across environments',
        'Require more memory',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Kubernetes is primarily used to:',
      choices: [
        'Edit cloud-based documents',
        'Automate deployment and scaling of containers',
        'Store large volumes of data',
        'Manage encryption keys',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'In Kubernetes, a node refers to:',
      choices: [
        'A server that runs workloads',
        'A directory for storing images',
        'A file used for software updates',
        'A security permission level',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Serverless computing allows developers to:',
      choices: [
        'Manage and configure server hardware',
        'Deploy functions without provisioning infrastructure',
        'Build only desktop applications',
        'Run systems that never scale automatically',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The zero-trust security model assumes that:',
      choices: [
        'All internal users are trustworthy',
        'Devices outside the network must be trusted automatically',
        'No user or device is trusted by default',
        'Security checks slow down the network',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A multi-cloud strategy involves:',
      choices: [
        'Using only private cloud resources',
        'Combining services from multiple cloud providers',
        'Eliminating all external cloud platforms',
        'Restricting workloads to on-premise servers only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'One advantage of hybrid cloud environments is that they:',
      choices: [
        'Prevent workloads from moving between clouds',
        'Allow sensitive tasks to stay private while using public cloud scalability',
        'Require only one type of cloud provider',
        'Eliminate all networking requirements',
      ],
      correctIndex: 1,
    ),

  ];
}
