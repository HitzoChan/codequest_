import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'integrative_programming_beginner_clean',
    title: 'Integrative Programming – Beginner',
    description:
        'Beginner module introducing integrative programming concepts, programming paradigms, components of integrated applications, APIs, libraries, and data formats.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'ip_beginner_ch1',
        title: 'Introduction to Integrative Programming',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the core ideas of integrative programming and why modern applications rely on multiple languages, tools, and components working together.

Topics include:
• What integrative programming is and why applications often use multiple languages and technologies  
• Programming paradigms such as procedural, object-oriented, and event-driven programming  
• Components of an integrated application including user interface, application logic, and data storage  
• APIs for communication between applications and accessing external services  
• External libraries that provide ready-made functions to simplify development  
• Data formats like JSON and XML used for exchanging information across systems  
• Fundamental principles of software integration and its importance in modern development  

This module provides a solid foundation for understanding how different technologies come together to create complete software solutions.
''',
        content:
            'A beginner-friendly explanation of multiple programming paradigms, integration layers, APIs, external libraries, and standardized data formats used in modern software development. It highlights the importance of combining technologies to build flexible and scalable applications.',
        youtubeUrl: 'https://www.youtube.com/watch?v=eIrMbAQSU34',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=16OfHUjSid4YzRpwy23ImOu1SvuQLU5Kz',
      ),
    ],
  ),
];
