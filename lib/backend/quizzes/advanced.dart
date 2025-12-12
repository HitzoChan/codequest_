import 'models.dart';

class AdvancedDiscreteMathQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'A graph is primarily composed of:',
      choices: [
        'Equations and inequalities',
        'Vertices (nodes) and edges (connections)',
        'Only numerical sequences',
        'Angles and geometric shapes',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A tree is a special type of graph because it:',
      choices: [
        'Contains cycles and loops',
        'Has no cycles and follows a hierarchical structure',
        'Contains no vertices',
        'Must always be a binary tree',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A binary tree is defined as a tree in which:',
      choices: [
        'Each node has at most two children',
        'All nodes have exactly three children',
        'The tree must be perfectly balanced',
        'Nodes are arranged randomly',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Recurrence relations describe:',
      choices: [
        'Graphical solutions to equations',
        'Sequences where each term depends on previous terms',
        'Only one-time events',
        'Data that cannot be represented numerically',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The Fibonacci sequence is an example of:',
      choices: [
        'A direct formula',
        'A recurrence relation',
        'A combinatorial proof',
        'A graph traversal',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Permutations are used when:',
      choices: [
        'Order does not matter',
        'Order matters in arranging objects',
        'There are no possible arrangements',
        'All objects are identical',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Combinations are used for counting:',
      choices: [
        'Arrangements where order matters',
        'Selections where order does not matter',
        'Outcomes with infinite sets',
        'Graph edges only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Depth-first search (DFS) explores a graph by:',
      choices: [
        'Visiting all neighbors level by level',
        'Exploring as far as possible along a branch before backtracking',
        'Calculating probabilities',
        'Sorting nodes alphabetically',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Dijkstra’s algorithm is used to find:',
      choices: [
        'The number of cycles in a graph',
        'The shortest path between nodes in a weighted graph',
        'The maximum possible path',
        'The total number of spanning trees',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A minimum spanning tree (MST) is:',
      choices: [
        'A tree with the largest possible total weight',
        'A tree connecting all vertices with the minimum total edge weight',
        'A tree that must have cycles',
        'A random subset of edges in a graph',
      ],
      correctIndex: 1,
    ),

  ];
}
