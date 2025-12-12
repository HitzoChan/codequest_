import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'oop_beginner_clean',
    title: 'Object-Oriented Programming – Beginner',
    description:
        'Beginner module introducing the fundamentals of Object-Oriented Programming, including classes, objects, encapsulation, inheritance, polymorphism, and abstraction.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'oop_beginner_ch1',
        title: 'Introduction to OOP, Classes, Objects & Core Principles',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces learners to the core concepts of Object-Oriented Programming (OOP) and how it improves software structure and organization.

Topics include:
• What OOP is and how it models real-world entities through objects  
• Understanding classes as blueprints that define attributes and methods  
• Creating objects as instances that store data and perform actions  
• Encapsulation for protecting internal data and grouping behavior with data  
• Inheritance for reusing features and forming hierarchical relationships  
• Polymorphism and method overriding for flexible behavior  
• Abstraction for simplifying complexity and hiding unnecessary implementation details  
• The importance of OOP in creating reusable, modular, and maintainable software  

This module prepares beginners to understand modern programming structures used in many popular languages.
''',
        content:
            'A beginner-friendly explanation of how OOP organizes programs around objects, including the roles of classes, attributes, methods, encapsulation, inheritance, polymorphism, and abstraction in software design.',
        youtubeUrl: 'https://www.youtube.com/watch?v=SiBw7os-_zI',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1coFVhQPKZ2ZJ1f0kqnrX30BOx4vEJRuC',
      ),
    ],
  ),
];
