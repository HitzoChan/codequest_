import 'models.dart';

class AdvancedSoftwareEngineeringQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Software quality refers to:',
      choices: [
        'The speed of the development team',
        'How well the software meets requirements and user expectations',
        'The number of features added',
        'The size of the project budget',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Reliability, usability, and maintainability are examples of:',
      choices: [
        'Coding standards',
        'Hardware requirements',
        'Software quality attributes',
        'Deployment procedures',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Unit testing focuses on:',
      choices: [
        'Testing multiple systems together',
        'Evaluating small, individual components of the software',
        'Checking user satisfaction',
        'Running the software on different hardware devices',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Integration testing is done to:',
      choices: [
        'Test the complete software in a real environment',
        'Verify that combined modules work correctly together',
        'Test only documentation',
        'Evaluate only non-functional requirements',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Black-box testing evaluates software by:',
      choices: [
        'Inspecting internal source code',
        'Focusing only on hardware behavior',
        'Testing inputs and outputs without examining internal logic',
        'Debugging code line by line',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Regression testing ensures that:',
      choices: [
        'New features replace old ones completely',
        'Changes do not introduce new defects into previously working features',
        'Documentation is always updated',
        'The software runs faster after updates',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A test plan is used to:',
      choices: [
        'Describe the system architecture',
        'Outline the testing strategy, scope, and resources',
        'Write source code',
        'Perform hardware installation',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Software Configuration Management (SCM) is used to:',
      choices: [
        'Remove changes permanently',
        'Control, track, and manage changes in software',
        'Estimate project budget',
        'Create marketing materials',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Version control systems such as Git help teams by:',
      choices: [
        'Preventing collaboration',
        'Tracking changes and allowing developers to merge work safely',
        'Automatically writing test cases',
        'Removing old project files',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Models like CMMI and ISO 9001 are used for:',
      choices: [
        'Debugging program errors',
        'Improving and evaluating software development processes',
        'Creating diagrams only',
        'Designing user interfaces',
      ],
      correctIndex: 1,
    ),

  ];
}
