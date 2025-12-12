import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'oop_advanced_clean',
    title: 'Object-Oriented Programming – Advanced',
    description:
        'Advanced module covering abstract classes, interfaces, exception handling, dynamic binding, polymorphism, and SOLID design principles.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'oop_advanced_ch1',
        title: 'Abstract Classes, Interfaces, Exception Handling & Design Principles',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores high-level OOP concepts used to build scalable, flexible, and maintainable software systems.

Topics include:
• Abstract classes for defining templates that share implementation while requiring subclasses to provide specific behaviors  
• Interfaces as contracts that enforce required behaviors across unrelated classes  
• Exception handling using try–catch–finally to manage runtime errors and ensure program reliability  
• Advanced polymorphism and dynamic binding, where method execution is determined at runtime  
• How dynamic binding supports extensible designs and common design patterns  
• Core object-oriented design principles, including the SOLID framework:  
  – Single Responsibility Principle  
  – Open/Closed Principle  
  – Liskov Substitution Principle  
  – Interface Segregation Principle  
  – Dependency Inversion Principle  

This module prepares learners to design professional, large-scale systems that remain adaptable and robust over time.
''',
        content:
            'A comprehensive look at abstract classes, interfaces, exception handling, advanced polymorphism, and SOLID principles. Learners gain the ability to architect complex systems that balance structure, flexibility, and reliability.',
        youtubeUrl: 'https://www.youtube.com/watch?v=HvPlEJ3LHgE',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=13sirefyPpsjQjaN7MlC0KQ2dSdM9m6sQ',
      ),
    ],
  ),
];
