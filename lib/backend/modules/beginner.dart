import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'it_pm_beginner_clean',
    title: 'IT Project Management – Beginner',
    description:
        'Beginner module introducing IT project management concepts, project fundamentals, roles, and constraints.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'it_pm_beginner_ch1',
        title: 'Introduction to IT Project Management',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the basic concepts of IT Project Management and why it is important in the IT industry.

Topics include:
• Definition and purpose of IT Project Management  
• What a project is and how it differs from daily operations  
• Examples of IT projects such as software and application development  
• Common reasons why IT projects fail  
• The project life cycle and its main phases  
• Roles and responsibilities in IT projects  
• Project stakeholders and their interests  
• The three main project constraints: scope, time, and cost  

These topics provide a foundation for understanding how IT projects are planned, managed, and successfully completed.
''',
        content:
            'A beginner-level overview of IT Project Management covering project fundamentals, life cycle phases, roles, stakeholders, and basic project constraints.',
        
        youtubeUrl: 'https://youtu.be/ThDdHETxA-g?si=dIycRR6xyZ3pp39m',
        
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1GeRaERLXXxmiuCrBUmVNWh54ZPMMQg9T',
      ),
    ],
  ),
];
