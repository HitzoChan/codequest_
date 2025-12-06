import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'mobile_dev_101_advanced',
    title: 'Mobile Dev - Advanced',
    description: 'Advanced modules for mobile development and algorithms.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'data_structures_advanced_01',
        title: 'Advanced Data Structures & Algorithms',
        content: '''
    This module explores advanced data structures and algorithmic techniques used in high-performance software, competitive programming, and technical interviews.

    It covers the following advanced topics:

    • Balanced Trees (AVL, Red–Black Trees, Splay Trees)
    • Hashing: collision resolution, double hashing, perfect hashing
    • Priority Queues & Heaps (binary, binomial, Fibonacci heaps)
    • Advanced Graph Algorithms:
        – Strongly Connected Components (Kosaraju / Tarjan)
        – Topological Sorting (DFS & Kahn’s)
        – Dijkstra, Bellman–Ford, Floyd–Warshall
        – Minimum Spanning Trees (Kruskal, Prim)
    • Dynamic Programming (tabulation, memoization, optimized DP)
    • Tries, Suffix Trees, and Suffix Arrays
    • Union-Find (Disjoint Set Union) with path compression + rank
    • Advanced sorting and searching optimizations
    • Time and space complexity analysis for large-scale systems
    ''',
        orderIndex: 7,
        difficultyLevel: 'Advanced',
        youtubeUrl: 'https://youtu.be/ndg3nEVK3VM',
        summary:
            'This module covers advanced data structures, graph algorithms, dynamic programming, and optimization concepts.',
        pdfUrl: 'https://drive.google.com/uc?export=download&id=YOUR_ADVANCED_DSA_PDF_ID',
      ),
    ],
  ),
];
