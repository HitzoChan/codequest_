import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'mobile_dev_beginner_clean',
    title: 'Mobile Application Development – Beginner',
    description:
        'Beginner module introducing mobile application development, platforms, app structures, and development tools.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'mobile_dev_beginner_ch1',
        title: 'Introduction to Mobile Application Development',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the fundamentals of mobile application development.

Topics include:
• Definition of mobile application development  
• Mobile platforms such as Android and iOS  
• Types of mobile applications: native and cross-platform  
• Basic structure of a mobile app including UI and logic layers  
• Role of APIs in mobile applications  
• Development tools such as Android Studio  
• Programming languages used in mobile development  

These topics provide a foundation for understanding how mobile apps are designed and built.
''',
        content:
            'A beginner-level overview of mobile application development covering platforms, application types, app structure, development tools, and basic programming concepts.',
        youtubeUrl: 'https://www.youtube.com/watch?v=FjrKMcnKahY',
       
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1CWEh6uJApumgQzaF-k7VBesAzOulF3t9',
      ),
    ],
  ),
];
