import 'models.dart';

// Placeholder for future advanced-level quizzes.
// Add classes similar to SqlIntroQuiz here when needed.

class DataStructuresAdvancedQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'Which tree-rotation property helps maintain balance in an AVL tree?',
      choices: [
        'Black-height constraints',
        'Recoloring rules',
        'Height difference of at most 1 between subtrees',
        'Lazy propagation'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which advanced heap structure allows decrease-key in O(1) amortized time?',
      choices: [
        'Binary Heap',
        'Binomial Heap',
        'Fibonacci Heap',
        'Leftist Heap'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Kosaraju’s algorithm requires how many full DFS passes to compute Strongly Connected Components (SCCs)?',
      choices: ['1', '2', '3', 'Depends on graph density'],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which algorithm correctly handles graphs with negative edge weights but no negative cycles?',
      choices: [
        'Dijkstra with min-heap',
        'Bellman-Ford',
        'Prim’s Algorithm',
        'Kruskal’s Algorithm'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which data structure supports lexicographical string queries and substring matching efficiently?',
      choices: [
        'Binary Search Tree',
        'Suffix Tree',
        'Hash Table',
        'Queue'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Tarjan’s algorithm for SCCs relies heavily on which concept?',
      choices: [
        'Union-Find',
        'Strong heap ordering',
        'Low-link values',
        'Bitmask DP'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'The amortized time complexity of Union-Find with union-by-rank and path compression is:',
      choices: [
        'O(1)',
        'O(log n)',
        'O(α(n)) where α is inverse Ackermann function',
        'O(n)'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which sorting algorithm guarantees O(n log n) worst-case performance?',
      choices: [
        'Quick Sort',
        'Merge Sort',
        'Heap Sort',
        'Insertion Sort'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which algorithmic paradigm is typically used to optimize exponential brute-force solutions into polynomial ones?',
      choices: [
        'Divide and Conquer',
        'Greedy Strategy',
        'Dynamic Programming',
        'Backtracking'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'The Floyd–Warshall algorithm computes:',
      choices: [
        'Single-source shortest paths',
        'Minimum spanning tree',
        'All-pairs shortest paths',
        'Strongly connected components'
      ],
      correctIndex: 2,
    ),
  ];
}
