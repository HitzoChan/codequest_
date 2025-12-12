import 'models.dart';

class IntermediateDSAQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'A stack follows which principle?',
      choices: [
        'First-In, First-Out',
        'Last-In, First-Out',
        'Random Access Order',
        'Sorted Order Only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The operation that adds an element to the top of a stack is called:',
      choices: [
        'Insert',
        'Push',
        'Enqueue',
        'Peek',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A queue removes elements using:',
      choices: [
        'Pop',
        'Dequeue',
        'Push',
        'Reverse',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which principle does a queue follow?',
      choices: [
        'LIFO',
        'FIFO',
        'Random Access',
        'Priority-Based Only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Linear search works by:',
      choices: [
        'Dividing the list repeatedly',
        'Checking each element one by one',
        'Sorting before searching',
        'Jumping directly to the middle',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Binary search is much faster than linear search but requires:',
      choices: [
        'The data to be sorted',
        'Very small datasets',
        'Linked lists instead of arrays',
        'No comparisons',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Bubble sort works by:',
      choices: [
        'Selecting the smallest element each time',
        'Comparing and swapping adjacent elements repeatedly',
        'Jumping to random positions',
        'Removing duplicate values only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Selection sort works by:',
      choices: [
        'Picking the smallest element and placing it in its correct position',
        'Swapping elements without comparisons',
        'Sorting only part of the list',
        'Sorting in reverse alphabetical order',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'A recursive function must include:',
      choices: [
        'At least two loops',
        'A base case to stop recursion',
        'A constant return value',
        'No parameters',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Recursion is helpful for problems that:',
      choices: [
        'Cannot be broken into smaller tasks',
        'Require repetitive or self-similar steps',
        'Must run without function calls',
        'Only involve arrays',
      ],
      correctIndex: 1,
    ),

  ];
}
