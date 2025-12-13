import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'mobile_dev_intermediate_clean',
    title: 'Mobile Application Development – Intermediate',
    description:
        'Intermediate module covering UI/UX principles, navigation structures, local data storage, and API integration.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'mobile_dev_intermediate_ch1',
        title: 'UI/UX Design, Data Storage & API Integration',
        difficultyLevel: 'Intermediate',
        summary: '''
This module focuses on practical mobile application development concepts that improve usability, data handling, and app connectivity.

Topics include:
• UI/UX design principles for mobile applications  
• Visual hierarchy and user-centered interface design  
• Navigation patterns such as tab bars and bottom navigation  
• Local data storage using Shared Preferences and SQLite  
• API integration for accessing external services  
• JSON data formats used in API communication  
• Asynchronous operations and callbacks to keep apps responsive  

These topics help developers build functional, user-friendly, and responsive mobile applications.
''',
        content:
            'An intermediate-level exploration of UI/UX design, navigation patterns, local data storage, API integration, and asynchronous programming in mobile applications.',
        
        youtubeUrl: 'https://youtu.be/ODpB9-MCa5s?si=SGx4Hy3zsc-XxMVK',
        
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=14S0EzumAtKpE-iLRsjlAsLojkXxyGvys',
      ),
    ],
  ),
];
