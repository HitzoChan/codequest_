import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'dsa_advanced_clean',
    title: 'Data Structures & Algorithms – Advanced',
    description:
        'Advanced module covering trees, binary search trees, graphs, hashing, and algorithm design techniques.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'dsa_advanced_ch1',
        title: 'Trees, Graphs, Hashing & Algorithm Design',
        difficultyLevel: 'Advanced',
        summary: '''
This module covers advanced data structures and algorithm design techniques used in modern computing systems.

Topics include:
• Trees as hierarchical data structures using parent-child relationships  
• Binary Search Trees (BST) and how ordering improves search efficiency  
• Graphs composed of vertices and edges to represent relationships  
• Breadth-First Search (BFS) and Depth-First Search (DFS) graph traversal methods  
• Hash tables and the use of hash functions for fast data storage  
• Hash collisions and why they occur  
• Algorithm design strategies such as Divide and Conquer, Greedy algorithms, and Dynamic Programming  

These concepts are essential for building efficient, scalable, and high-performance software systems.
''',
        content:
            'An advanced study of trees, binary search trees, graphs, hashing, and algorithm design techniques used to solve complex computational problems efficiently.',
        // ✅ YouTube link is used ONLY in the module
        youtubeUrl: 'https://youtu.be/bum_19loj9A?si=rUbdJVeFqnlstlBx',
        // ✅ PDF link you provided
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1gBnm38Veczd0exQA4AJq6a37hAdJ-p-A',
      ),
    ],
  ),
];
