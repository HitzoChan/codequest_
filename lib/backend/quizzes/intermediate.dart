import 'models.dart';

class IntermediateDiscreteMathQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'A relation is best described as:',
      choices: [
        'A set of numbers in ascending order',
        'A set of ordered pairs connecting elements of one set to another',
        'A method for solving equations',
        'A type of function that has no domain',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A relation is symmetric if:',
      choices: [
        'Each element relates only to itself',
        'For every pair (a, b), the pair (b, a) is also in the relation',
        'No pairs repeat',
        'The relation contains no elements',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A function differs from a general relation because:',
      choices: [
        'It allows multiple outputs for one input',
        'Each input corresponds to exactly one output',
        'It contains no ordered pairs',
        'It always has the same domain and range',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The domain of a function refers to:',
      choices: [
        'All possible outputs',
        'All elements that have no relation',
        'All possible inputs',
        'Only the largest value in the set',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'According to the Product Rule, if event A can happen in 3 ways and event B in 4 ways, then both events together can occur in:',
      choices: [
        '7 ways',
        '12 ways',
        '1 way',
        '3 ways',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The Sum Rule applies when events:',
      choices: [
        'Happen at the same time',
        'Cannot occur together',
        'Must occur in sequence',
        'Have no possible outcomes',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Modus Ponens is used in logic to conclude:',
      choices: [
        'If P then Q; P is true, therefore Q is true',
        'If P then Q; Q is false, therefore P is true',
        'If P then Q; P is false, therefore Q must be true',
        'If P then Q; Q is true, therefore P is false',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Mathematical induction is commonly used to:',
      choices: [
        'Solve algebraic equations directly',
        'Prove statements involving natural numbers',
        'Measure geometric angles',
        'Evaluate trigonometric expressions',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'In mathematical induction, the base case:',
      choices: [
        'Is optional',
        'Must always be proved first',
        'Can be skipped if the inductive step is correct',
        'Only applies to even numbers',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The inductive step requires showing that:',
      choices: [
        'If the statement holds for k, then it holds for k + 1',
        'The statement is true only for one specific number',
        'The statement is unrelated to natural numbers',
        'The proof has no logical structure',
      ],
      correctIndex: 0,
    ),

  ];
}
