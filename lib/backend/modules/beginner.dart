import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'dsa_beginner_clean',
    title: 'Data Structures & Algorithms – Beginner',
    description:
        'Beginner module introducing the foundations of data structures, algorithms, arrays, linked lists, and basic time complexity.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'dsa_beginner_ch1',
        title: 'Introduction to Data Structures, Algorithms & Basic Operations',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the essential building blocks of Data Structures and Algorithms (DSA), forming the basis of efficient programming.

Topics include:
• What data structures and algorithms are and why they matter in computing  
• Arrays as continuous memory structures that allow fast indexed access  
• Linked lists as flexible node-based structures ideal for insertions and deletions  
• Differences between static and dynamic storage organization  
• Characteristics of good algorithms: clarity, correctness, efficiency, and finiteness  
• Basic operations such as accessing, updating, and traversing data  
• Introduction to Big-O notation for estimating algorithm performance  

These foundations prepare learners for solving computational problems, writing efficient code, and progressing toward more complex structures and algorithms.
''',
        content:
            'A beginner-friendly explanation of arrays, linked lists, algorithm basics, and the role of Big-O notation in evaluating efficiency. This sets the groundwork for building fast and scalable programs.',
        youtubeUrl: 'https://www.youtube.com/watch?v=RBSGKlAvoiM',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1LS1uqEM0ykVrAZHFYTLBcTU3wiNjkwp4',
      ),
    ],
  ),
];
