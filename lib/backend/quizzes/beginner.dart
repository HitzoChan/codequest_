import 'models.dart';

class BeginnerDSAQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'A data structure is:',
      choices: [
        'A programming language',
        'A way of organizing and storing data efficiently',
        'A type of hardware device',
        'A mathematical equation',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'An algorithm is best described as:',
      choices: [
        'A random guess',
        'A step-by-step procedure for solving a problem',
        'A type of data structure',
        'A storage device',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Arrays store data:',
      choices: [
        'In random memory locations',
        'In continuous memory locations with fixed size',
        'Only in alphabetical order',
        'Using pointers only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A major limitation of arrays is that they:',
      choices: [
        'Cannot store numbers',
        'Cannot be accessed by index',
        'Have a fixed size once created',
        'Are slower than all other structures',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A linked list stores data using:',
      choices: [
        'Contiguous memory blocks',
        'Nodes linked by pointers or references',
        'Only two elements at a time',
        'A fixed-size table',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'One advantage of linked lists is that they:',
      choices: [
        'Require no memory',
        'Allow fast insertions and deletions',
        'Can only store integers',
        'Always run faster than arrays',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'An algorithm that checks every element in a list one by one has a time complexity of:',
      choices: [
        'O(1)',
        'O(n)',
        'O(n²)',
        'O(log n)',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Big-O notation is used to measure:',
      choices: [
        'How attractive code looks',
        'The efficiency of an algorithm',
        'How many languages a programmer knows',
        'Hardware performance',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A good algorithm must be:',
      choices: [
        'Infinite and unpredictable',
        'Correct, efficient, and clear',
        'Complicated and long',
        'Written only in one specific language',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Arrays provide fast access to elements because:',
      choices: [
        'They store elements in continuous memory and use indexes',
        'They automatically search for the largest element',
        'They use random storage patterns',
        'They convert all values to pointers',
      ],
      correctIndex: 0,
    ),

  ];
}
