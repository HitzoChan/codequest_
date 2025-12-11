import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'programming_advanced_clean',
    title: 'Computer Programming – Advanced',
    description:
        'Advanced module covering OOP principles, class design, exception handling, recursion, and introductory data structures for building scalable software.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'programming_advanced_ch1',
        title: 'OOP Principles, Exception Handling, Recursion, and Data Structures',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced programming concepts used to design structured, efficient, and scalable software systems.

Topics include:
• Object-oriented programming (OOP) concepts including encapsulation, inheritance, polymorphism, and abstraction  
• Class and object design including constructors, method design, and class relationships  
• Exception handling for managing unexpected errors and improving program reliability  
• Recursion as a problem-solving technique with base cases, recursive calls, and algorithmic thinking  
• Introduction to data structures including stacks, queues, and linked lists  
• How these concepts support modular, maintainable, and real-world software solutions  

This module prepares learners for higher-level development and complex programming challenges.
''',
        content:
            'A detailed exploration of OOP principles, class structures, exception-handling mechanisms, and recursion as a technique for solving hierarchical and repetitive problems. The module also introduces essential data structures like stacks, queues, and linked lists to enhance program organization and efficiency.',
        youtubeUrl: 'https://www.youtube.com/watch?v=pTB0EiLXUC8',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1n1A0ASRYmYElAdBuOFhdAuCMLBHtRFBz',
      ),
    ],
  ),
];
