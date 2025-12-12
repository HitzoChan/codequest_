import 'models.dart';

class BeginnerSoftwareEngineeringQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Software Engineering focuses on:',
      choices: [
        'Writing short programs only',
        'A systematic approach to designing and maintaining software',
        'Hardware installation and repair',
        'Creating software without planning',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Software Engineering is different from programming because:',
      choices: [
        'Programming does not require code',
        'Software Engineering involves the entire development process, not just coding',
        'Programming is more complex',
        'Software Engineering does not use programming languages',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The Software Development Life Cycle (SDLC) is:',
      choices: [
        'A random set of coding rules',
        'A structured process for developing software',
        'A debugging tool',
        'A version of operating systems',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which phase of the SDLC focuses on determining user needs?',
      choices: [
        'Testing',
        'Deployment',
        'Requirements Analysis',
        'Maintenance',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'The Waterfall Model is best described as:',
      choices: [
        'A flexible, rapidly changing approach',
        'A linear sequence of development phases',
        'A model used only for mobile apps',
        'A method with no documentation',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Agile development is characterized by:',
      choices: [
        'Long phases with no user interaction',
        'Frequent feedback and short development cycles',
        'No testing phases',
        'A strict sequence that cannot change',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Functional requirements describe:',
      choices: [
        'How fast a system should run',
        'Specific actions or features the system must perform',
        'The color of the interface',
        'The hardware specifications',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Non-functional requirements describe:',
      choices: [
        'The individual programmers involved',
        'System qualities such as performance and security',
        'The list of functional modules',
        'Only database rules',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Interviews, surveys, and observations are used for:',
      choices: [
        'Writing code',
        'Gathering software requirements',
        'Designing interfaces',
        'Deploying software to users',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Clear and accurate requirements are important because they:',
      choices: [
        'Make coding unnecessary',
        'Ensure all stakeholders share the same understanding of the system',
        'Allow the project to skip testing',
        'Reduce the number of developers required',
      ],
      correctIndex: 1,
    ),

  ];
}
