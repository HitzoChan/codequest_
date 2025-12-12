import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'discrete_math_advanced_clean',
    title: 'Discrete Mathematics – Advanced',
    description:
        'Advanced module covering graph theory, trees, recurrence relations, advanced counting techniques, and graph algorithms.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'discrete_math_advanced_ch1',
        title: 'Graphs, Trees, Recurrence Relations & Advanced Counting',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced discrete structures used throughout computer science, focusing on mathematical models that describe networks, hierarchical systems, recursive patterns, and combinatorial problems.

Topics include:
• Graph theory fundamentals including vertices, edges, types of graphs, and applications in real-world networks  
• Trees and hierarchical structures, including binary trees, levels, height, and their role in data organization  
• Recurrence relations for defining sequences based on previous terms, used in analyzing recursive algorithms  
• Advanced counting techniques such as permutations and combinations for determining arrangements and selections  
• Essential graph algorithms including DFS, BFS, shortest-path techniques, and minimum spanning tree algorithms  

These concepts form the foundation of modern algorithm design, network analysis, and computational problem solving.
''',
        content:
            'A comprehensive exploration of graph theory, tree structures, recurrence relations, combinatorics, and graph algorithms used to model networks, analyze algorithm complexity, and solve advanced mathematical problems.',
        youtubeUrl: 'https://www.youtube.com/watch?v=HipVU5vz3Q8',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1VzPYDLrxMZxFp1o9t_TvV6_DWKUKQWAd',
      ),
    ],
  ),
];
