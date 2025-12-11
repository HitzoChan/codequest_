import 'models.dart';

class IntermediateCloudComputingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Virtualization enables cloud computing by:',
      choices: [
        'Replacing internet connections',
        'Creating virtual versions of computing resources',
        'Eliminating the need for servers',
        'Running only one application at a time',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A virtual machine (VM) is best described as:',
      choices: [
        'A physical server located in a data center',
        'A computer simulation that behaves like a separate device',
        'A type of cloud storage',
        'A backup management tool',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Server virtualization is useful because it:',
      choices: [
        'Forces each application to run on its own physical machine',
        'Reduces hardware efficiency',
        'Allows multiple virtual servers to run on one physical server',
        'Eliminates the need for an operating system',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Storage virtualization involves:',
      choices: [
        'Combining multiple physical storage devices into a unified system',
        'Removing local storage from all computers',
        'Preventing users from accessing shared files',
        'Converting storage into software applications',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Which type of cloud storage is most suitable for handling large amounts of unstructured data like images or videos?',
      choices: [
        'Block storage',
        'File storage',
        'Object storage',
        'Local disk storage',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Cloud networking allows organizations to:',
      choices: [
        'Limit connectivity to only on-site systems',
        'Manage network resources and configurations through cloud platforms',
        'Replace all routers with physical cables',
        'Disable remote access permanently',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The shared responsibility model states that cloud providers are responsible for:',
      choices: [
        'Securing customer passwords',
        'Managing internal company policies',
        'Protecting the cloud infrastructure',
        'Monitoring employee access behavior',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Encryption in cloud security is used to:',
      choices: [
        'Reduce storage space',
        'Convert data into a protected format',
        'Increase network speed',
        'Delete unused files automatically',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Compliance in cloud computing ensures that:',
      choices: [
        'Users can freely access all organizational data',
        'Data is managed according to legal and industry standards',
        'Cloud providers decide all internal company rules',
        'Only free software is used in the cloud',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Why is virtualization important in cloud environments?',
      choices: [
        'It reduces the number of applications available',
        'It prevents system scalability',
        'It enables flexible and efficient use of physical hardware',
        'It restricts the creation of new servers',
      ],
      correctIndex: 2,
    ),

  ];
}
