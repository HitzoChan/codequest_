import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'mobile_dev_advanced_clean',
    title: 'Mobile Application Development – Advanced',
    description:
        'Advanced module covering mobile app architecture, performance optimization, security, testing, and deployment.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'mobile_dev_advanced_ch1',
        title: 'Architecture, Performance, Security & Deployment',
        difficultyLevel: 'Advanced',
        summary: '''
This module focuses on advanced mobile application development concepts required to build production-ready apps.

Topics include:
• Mobile application architecture patterns such as MVC, MVVM, and Clean Architecture  
• Separation of UI, business logic, and data layers  
• Performance optimization and profiling using development tools  
• Memory management and prevention of memory leaks  
• Secure coding practices and secure API communication  
• Backend integration and data synchronization  
• Unit testing and UI testing strategies  
• Deployment requirements for Google Play Store and Apple App Store  

These topics prepare developers to create scalable, secure, and high-quality mobile applications.
''',
        content:
            'An advanced-level study of mobile application architecture, performance optimization, security practices, backend integration, testing, and deployment to app stores.',
        // ✅ YouTube link used ONLY in the module
        youtubeUrl: 'https://youtu.be/yye7rSsiV6k?si=DAWaTjrlC6pLp054',
        // ✅ PDF link you provided
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1fkKVXeyjqKgoLNg8lHycZCKZHsQNb-eV',
      ),
    ],
  ),
];
