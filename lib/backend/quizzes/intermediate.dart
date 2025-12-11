import 'models.dart';

class IntermediateInformationManagementQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'What is the primary purpose of a database?',
      choices: [
        'To create documents',
        'To store and organize data efficiently',
        'To design graphics',
        'To run hardware components',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which software allows users to create, manage, and access a database?',
      choices: [
        'Operating System',
        'Spreadsheet Program',
        'Database Management System',
        'Web Browser',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'One major function of a DBMS is to:',
      choices: [
        'Print documents automatically',
        'Control data storage, retrieval, and security',
        'Create video files',
        'Manage computer hardware',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The relational database model stores data in structures known as:',
      choices: [
        'Trees',
        'Tables',
        'Networks',
        'Images',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What does a primary key do in a relational table?',
      choices: [
        'Links two databases together',
        'Compresses data',
        'Uniquely identifies each record',
        'Hides sensitive data',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A foreign key is used to:',
      choices: [
        'Remove duplicate tables',
        'Identify a record within the same table',
        'Link one table to another',
        'Convert data into graphics',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'In an ERD, entities represent:',
      choices: [
        'Colors and themes of a system',
        'Real-world objects or concepts',
        'Network devices',
        'Hardware components',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Attributes in an ERD describe:',
      choices: [
        'The physical layout of a database',
        'The characteristics or properties of an entity',
        'How data is encrypted',
        'The backup procedure',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which data model is most commonly used in business applications today?',
      choices: [
        'Hierarchical model',
        'Network model',
        'Object-oriented model',
        'Relational model',
      ],
      correctIndex: 3,
    ),

    QuizQuestion(
      question: 'Why are databases important in information management?',
      choices: [
        'They eliminate the need for computers',
        'They ensure accurate, secure, and organized information',
        'They focus mainly on improving hardware',
        'They replace all manual work completely',
      ],
      correctIndex: 1,
    ),

  ];
}
