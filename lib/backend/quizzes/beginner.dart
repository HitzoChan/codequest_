import 'models.dart';

class BeginnerDiscreteMathQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Discrete Mathematics primarily studies:',
      choices: [
        'Continuous structures like curves and surfaces',
        'Separate, countable structures such as integers and logical statements',
        'Only geometry and measurement',
        'Physical experiments in science',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A proposition in logic is:',
      choices: [
        'A mathematical equation with variables',
        'A statement that is either true or false',
        'A symbol without meaning',
        'A diagram that shows sets',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following is a logical connective?',
      choices: [
        'Plus sign (+)',
        'And, or, not',
        'Square root',
        'Derivative',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Truth tables are used to:',
      choices: [
        'Count numbers in sequences',
        'Determine the truth value of compound logical statements',
        'Measure angles',
        'Graph linear equations',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A set is best described as:',
      choices: [
        'A random collection of unrelated facts',
        'A collection of distinct objects considered as a group',
        'A list of numbers in ascending order only',
        'A type of variable in algebra',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The empty set is the set that contains:',
      choices: [
        'No elements',
        'All possible elements',
        'Only one element',
        'Duplicate elements',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'The union of two sets A and B contains:',
      choices: [
        'Only elements common to both sets',
        'Only the elements of set A',
        'Only the elements of set B',
        'All elements that are in A, in B, or in both',
      ],
      correctIndex: 3,
    ),

    QuizQuestion(
      question: 'The intersection of sets A and B contains:',
      choices: [
        'All elements in the universal set',
        'Elements common to both A and B',
        'Only elements in A but not B',
        'Only elements in B but not A',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Venn diagrams help visualize:',
      choices: [
        'Steps in solving equations',
        'Geometric shapes',
        'Relationships between sets',
        'Graphs of functions',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Mathematical reasoning is important because it:',
      choices: [
        'Focuses on memorizing formulas',
        'Helps justify conclusions through logical thinking',
        'Eliminates the need to understand sets',
        'Prevents the use of truth tables',
      ],
      correctIndex: 1,
    ),

  ];
}
