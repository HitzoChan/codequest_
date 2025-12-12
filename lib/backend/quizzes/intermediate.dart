import 'models.dart';

class IntermediateHCIQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'The interaction design process is best described as:',
      choices: [
        'A single-step method for creating interfaces',
        'An iterative cycle of understanding user needs, designing solutions, and evaluating results',
        'A process focused only on programming workflows',
        'A technique used only for graphic design',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'User research is conducted to:',
      choices: [
        'Confirm assumptions without evidence',
        'Understand users’ behaviors, needs, and challenges',
        'Test only system hardware',
        'Remove the need for usability testing',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Interviews and surveys are useful in HCI because they:',
      choices: [
        'Provide direct feedback from users',
        'Replace observation entirely',
        'Only measure system performance',
        'Are required only at the end of a project',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Contextual inquiry focuses on:',
      choices: [
        'Studying users in artificial, controlled environments',
        'Observing users in their natural work settings',
        'Asking users only yes-or-no questions',
        'Testing prototypes without user involvement',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Information architecture is concerned with:',
      choices: [
        'Visual color choices',
        'How information is structured and organized for navigation',
        'Writing computer code',
        'Designing computer hardware',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Wireframes are valuable because they:',
      choices: [
        'Provide full-color, high-fidelity designs',
        'Show the layout and structure of a screen without detailed visuals',
        'Replace the need for any prototypes',
        'Are only used after a system is fully developed',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Low-fidelity prototypes help designers:',
      choices: [
        'Avoid revising their designs',
        'Test early ideas quickly and cheaply',
        'Finalize the system’s visual aesthetics',
        'Remove the need for user feedback',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Usability testing allows designers to:',
      choices: [
        'Measure how efficiently users complete tasks',
        'Skip user involvement during development',
        'Confirm that the system looks visually appealing',
        'Test hardware performance only',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'A heuristic evaluation is conducted by:',
      choices: [
        'Random users',
        'Experts using established usability principles',
        'Programmers testing only code errors',
        'Automated computer tools without human input',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The think-aloud method helps researchers because users:',
      choices: [
        'Remain silent during tasks',
        'Verbalize their thoughts, revealing decision-making and confusion',
        'Provide written reports after testing',
        'Focus only on visual design',
      ],
      correctIndex: 1,
    ),

  ];
}
