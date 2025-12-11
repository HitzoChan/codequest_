import 'models.dart';

class AdvancedIntegrativeProgrammingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Advanced integration architecture focuses mainly on:',
      choices: [
        'Designing systems that operate only on a single device',
        'Ensuring diverse components communicate efficiently and scale effectively',
        'Eliminating the need for distributed systems',
        'Limiting applications to one programming language',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Microservices differ from monolithic systems because they:',
      choices: [
        'Must be deployed all at once',
        'Are small, independent components that can be updated separately',
        'Cannot communicate with other services',
        'Are stored only in local machines',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Distributed systems improve reliability because they:',
      choices: [
        'Rely on one server to handle all tasks',
        'Spread processing across multiple machines or environments',
        'Remove redundancy between services',
        'Disable communication between components',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'API management is important because it:',
      choices: [
        'Prevents the monitoring of API usage',
        'Controls and secures how APIs are accessed and consumed',
        'Removes the need for documentation',
        'Limits applications to internal communication only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Orchestration in modern systems refers to:',
      choices: [
        'Manually configuring each service',
        'Automatically coordinating interactions among services',
        'Preventing services from communicating',
        'Storing all application data',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Event-driven integration allows systems to:',
      choices: [
        'Rely only on direct request–response communication',
        'Communicate through events that trigger actions in other services',
        'Ignore real-time data changes',
        'Function without messaging platforms',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Containerization improves integration by:',
      choices: [
        'Creating inconsistent environments across different machines',
        'Packaging applications and dependencies in portable, isolated units',
        'Requiring physical servers for deployment',
        'Preventing the use of CI/CD pipelines',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'CI/CD pipelines are used to:',
      choices: [
        'Slow down software development',
        'Automate integration, testing, and deployment',
        'Replace microservices',
        'Disable version control systems',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A zero-trust security approach assumes that:',
      choices: [
        'All users and systems are trusted automatically',
        'Verification is required for every request, internal or external',
        'Authentication is optional in integrated systems',
        'API traffic does not need encryption',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Security in integrated systems is critical because:',
      choices: [
        'Integrated applications never exchange sensitive data',
        'Multiple connected services increase potential attack points',
        'Microservices eliminate all security concerns',
        'Event-driven systems cannot be compromised',
      ],
      correctIndex: 1,
    ),

  ];
}
