import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'dsa_intermediate_clean',
    title: 'Data Structures & Algorithms – Intermediate',
    description:
        'Intermediate module covering stacks, queues, searching algorithms, sorting algorithms, and recursion.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'dsa_intermediate_ch1',
        title: 'Stacks, Queues, Searching, Sorting & Recursion',
        difficultyLevel: 'Intermediate',
        summary: '''
This module builds on basic data structures and algorithms by introducing more specialized structures and problem-solving techniques.

Topics include:
• Stacks and their Last-In, First-Out (LIFO) behavior  
• Stack operations such as push, pop, and peek  
• Real-world applications of stacks including undo operations and function calls  
• Queues and their First-In, First-Out (FIFO) behavior  
• Queue operations such as enqueue and dequeue  
• Linear search for locating elements in a list  
• Binary search and its requirement for sorted data  
• Bubble sort and selection sort for organizing data  
• Introduction to recursion and the importance of base cases  
• Using recursion to solve repetitive or self-similar problems  

These concepts improve algorithmic thinking and prepare learners for advanced structures and optimization techniques.
''',
        content:
            'A structured discussion of stacks, queues, searching and sorting algorithms, and recursion. Learners develop stronger problem-solving skills and understand how algorithm efficiency impacts performance.',
        youtubeUrl: 'https://www.youtube.com/watch?v=CBYHwZcbD-s',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=18yVFpZeum4bzgTJGiuVQ_YV5g3Y8M7kF',
      ),
    ],
  ),
];
