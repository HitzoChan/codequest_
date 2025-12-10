import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'sysint_beginner_clean',
    title: 'System Integration & Architecture – Beginner',
    description:
        'Beginner module introducing systems, system components, integration concepts, and basic architecture.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'sysint_beginner_ch1',
        title: 'Introduction to Systems and Integration',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the essential concepts of systems and how different components work together to support organizational operations.

Topics include:
• Understanding what a system is and how components work together  
• Components of an information system such as hardware, software, data, people, and processes  
• System integration and why organizations connect multiple subsystems  
• Types of integration such as data, application, and process integration  
• Introduction to system architecture as the blueprint of how system components interact  
• Importance of integration and architecture in improving efficiency and supporting organizational goals  
''',
        content:
            'An introductory explanation of systems, information system components, integration approaches, and basic architecture principles that help organizations coordinate operations and streamline workflows.',
        youtubeUrl: 'https://www.youtube.com/watch?v=D8ojzlGXSUo',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=10UW-V6Bo1Wh7YYBVZQH9jz1Hd8szUgfe',
      ),
    ],
  ),
];
