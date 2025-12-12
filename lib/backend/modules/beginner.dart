import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'discrete_math_beginner_clean',
    title: 'Discrete Mathematics – Beginner',
    description:
        'Beginner module introducing foundational concepts in discrete mathematics including logic, sets, and mathematical reasoning.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'discrete_math_beginner_ch1',
        title: 'Foundations of Logic, Sets, and Mathematical Reasoning',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the core ideas of discrete mathematics, focusing on structures that are separate, countable, and essential in computing.

Topics include:
• What discrete mathematics is and why it matters  
• Logic and propositions, including simple and compound statements  
• Logical connectives such as AND, OR, NOT, implication, and biconditional  
• Truth tables used to evaluate logical expressions  
• Introduction to sets: elements, notation, subsets, and the empty set  
• Set operations including union, intersection, difference, and complement  
• Venn diagrams for visualizing relationships between sets  
• Basic mathematical reasoning and introductory proof techniques  

These foundations strengthen analytical thinking and support future study in programming, algorithms, and data structures.
''',
        content:
            'An accessible introduction to logic, set theory, truth tables, and mathematical reasoning, helping learners develop clear analytical skills essential for computer science.',
        youtubeUrl: 'https://www.youtube.com/watch?v=D5sTEIVKYxA',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1AJc1J7pIQYzABsyV40-faQm6d3yHqbFB',
      ),
    ],
  ),
];
