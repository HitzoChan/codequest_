import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'info_mgmt_beginner_clean',
    title: 'Information Management – Beginner',
    description:
        'Beginner module introducing information management concepts, types of information, information life cycle, characteristics of good information, and components of information systems.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'info_mgmt_beginner_ch1',
        title: 'Introduction to Information Management',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the fundamental concepts of Information Management and how organizations handle information effectively.

Topics include:
• What Information Management is and why organizations rely on it  
• Types of information: operational, tactical, and strategic  
• The Information Life Cycle: creation, storage, use, maintenance, and disposal  
• Characteristics of good information such as accuracy, timeliness, completeness, and relevance  
• Components of an information system including hardware, software, people, procedures, and data  
• How effective information management supports decision-making and improves organizational performance  

This module provides a foundation for understanding how information flows and is managed in modern workplaces.
''',
        content:
            'A beginner-friendly overview of how information is collected, organized, stored, and used within organizations. It explains information types, life cycle stages, qualities of useful information, and the key elements that make up an information system.',
        youtubeUrl: 'https://www.youtube.com/watch?v=AChfIfQ4gjw',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1Lwlpl3AkNqmMdzerDBvR-w9il6y83ouf',
      ),
    ],
  ),
];
