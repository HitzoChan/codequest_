import 'models.dart';

class AdvancedSysIntQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Enterprise architecture (EA) is primarily used to:',
      choices: [
        'Focus only on software installation',
        'Align an organization’s technology with its strategic goals',
        'Replace all existing systems with new ones',
        'Limit organizational growth',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A key advantage of using an enterprise architecture framework such as TOGAF is that it:',
      choices: [
        'Eliminates the need for system documentation',
        'Provides structured methods for designing and managing enterprise systems',
        'Focuses only on hardware upgrades',
        'Avoids long-term planning',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Point-to-point integration becomes difficult to manage because:',
      choices: [
        'It is too secure',
        'It creates many direct connections as systems increase',
        'It requires standardized interfaces',
        'It supports only one application',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'In a hub-and-spoke integration model, the central hub is responsible for:',
      choices: [
        'Storing all user passwords',
        'Coordinating communication among connected systems',
        'Replacing the entire architecture',
        'Running only manual processes',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'An Enterprise Service Bus (ESB) is best described as:',
      choices: [
        'A physical network cable',
        'A messaging backbone that routes and transforms data',
        'A type of database management system',
        'Software used only for mobile applications',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Service-Oriented Architecture (SOA) promotes integration by:',
      choices: [
        'Creating tightly coupled software components',
        'Organizing functionality into reusable, loosely coupled services',
        'Removing all communication between applications',
        'Requiring one large monolithic system',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Microservices architecture improves flexibility because:',
      choices: [
        'All components must be deployed together',
        'Each service can be updated independently',
        'It eliminates the need for APIs',
        'It limits scalability',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Interoperability in integrated systems means that:',
      choices: [
        'Systems cannot exchange data',
        'Applications communicate using incompatible formats',
        'Different systems can work together and exchange information',
        'Data meanings differ across all systems',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Data standards such as XML and JSON help integration by:',
      choices: [
        'Preventing systems from sharing data',
        'Providing consistent ways to structure and transmit information',
        'Removing the need for multiple applications',
        'Replacing APIs',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Scalability in integrated systems refers to:',
      choices: [
        'Expanding system capacity to handle increased workloads',
        'Reducing system performance intentionally',
        'Removing servers to save resources',
        'Making systems operate on a single device only',
      ],
      correctIndex: 0,
    ),

  ];
}
