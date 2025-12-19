import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'it_pm_advanced_clean',
    title: 'IT Project Management – Advanced',
    description:
        'Advanced module covering Agile frameworks, quality management, leadership, change management, and project closure.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'it_pm_advanced_ch1',
        title: 'Agile Frameworks, Leadership & Project Closure',
        difficultyLevel: 'Advanced',
        summary: '''
This module focuses on advanced IT Project Management concepts for handling complex and dynamic projects.

Topics include:
• Agile project management principles and values  
• Agile frameworks such as Scrum and Kanban  
• Sprints, iterative delivery, and continuous feedback  
• Quality management and quality assurance in IT projects  
• Leadership skills including communication, motivation, and decision-making  
• Change management and handling project changes effectively  
• Project closure and post-implementation review  
• Importance of delivering value incrementally  

These topics prepare learners to lead complex IT projects and adapt to changing requirements.
''',
        content:
            'An advanced-level study of Agile project management, quality assurance, leadership, change management, and formal project closure in IT environments.',
        
        youtubeUrl: 'https://youtu.be/HK7inrw5YBw?si=1qalvWDxkWU3PBYx',
        
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1qJ32BBRhkP7qjqN4B5tOnXBvUM7zpQzn',
      ),
    ],
  ),
];
