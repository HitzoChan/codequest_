import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'oop_intermediate_clean',
    title: 'Object-Oriented Programming – Intermediate',
    description:
        'Intermediate module covering constructors, method overloading, access modifiers, object relationships, and static members.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'oop_intermediate_ch1',
        title: 'Constructors, Overloading, Access Modifiers & Object Relationships',
        difficultyLevel: 'Intermediate',
        summary: '''
This module expands foundational OOP concepts by exploring how objects are created, how methods handle different inputs, and how classes interact within a system.

Topics include:
• Constructors and their role in initializing objects  
• Default and parameterized constructors for setting initial attribute values  
• Method overloading for offering multiple versions of a method with different parameters  
• Access modifiers (public, private, protected) to control visibility and reinforce encapsulation  
• Object relationships such as association, aggregation, and composition to model real-world structures  
• Static variables and methods for class-level data and shared functionality  
• Designing applications where multiple classes work together to build structured, maintainable systems  

This module prepares learners to create more flexible, organized, and realistic object-oriented programs.
''',
        content:
            'A detailed explanation of constructors, method overloading, access control, object relationships, and static members. Learners develop stronger OOP design skills for building scalable and well-structured applications.',
        youtubeUrl: 'https://www.youtube.com/watch?v=Q6XT089lDmw',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1qQPXTIxH26A6IL5H-YdxMApyzl0JNUqY',
      ),
    ],
  ),
];
