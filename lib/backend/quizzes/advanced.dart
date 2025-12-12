import 'models.dart';

class AdvancedDSAQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'A tree is considered a hierarchical structure because:',
      choices: [
        'It stores data randomly',
        'It organizes nodes in parent-child relationships',
        'All nodes contain identical values',
        'It must always be balanced',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A binary search tree (BST) allows efficient searching because:',
      choices: [
        'It does not use comparisons',
        'Nodes are arranged so smaller values go left and larger values go right',
        'All values are stored in continuous memory',
        'It always contains the same number of nodes',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A major disadvantage of an unbalanced BST is that:',
      choices: [
        'It cannot store duplicate values',
        'It may behave like a linked list and reduce performance',
        'It requires hashing to function',
        'It cannot delete nodes',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A graph is composed of:',
      choices: [
        'Arrays and matrices only',
        'Vertices and edges that represent relationships',
        'Trees and subtrees',
        'Only weighted paths',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Breadth-First Search (BFS) explores a graph by:',
      choices: [
        'Visiting nodes level by level',
        'Going as deep as possible before backtracking',
        'Ignoring edges with weights',
        'Only exploring leaf nodes',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'A hash table stores data based on:',
      choices: [
        'Random selection',
        'A hash function that maps keys to index positions',
        'Numerical sorting',
        'Manual insertion order only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A hash collision occurs when:',
      choices: [
        'A key has no value',
        'Two different keys map to the same index',
        'The table becomes too large',
        'A hash function returns negative numbers',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Divide and Conquer works by:',
      choices: [
        'Solving problems without splitting them',
        'Breaking a problem into smaller subproblems and combining solutions',
        'Always using recursion only',
        'Searching the entire dataset sequentially',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Greedy algorithms make decisions by:',
      choices: [
        'Exploring all possible combinations',
        'Choosing the best immediate option at each step',
        'Comparing dynamic programming tables',
        'Avoiding local choices',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Dynamic Programming is effective for problems that:',
      choices: [
        'Cannot be broken down',
        'Contain overlapping subproblems and require storing intermediate results',
        'Must be sorted first',
        'Do not involve optimization',
      ],
      correctIndex: 1,
    ),

  ];
}
