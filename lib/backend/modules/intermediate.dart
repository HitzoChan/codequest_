import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'it_pm_intermediate_clean',
    title: 'IT Project Management – Intermediate',
    description:
        'Intermediate module focusing on project planning, scheduling, risk management, communication, and monitoring.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'it_pm_intermediate_ch1',
        title: 'Project Planning, Scheduling & Risk Management',
        difficultyLevel: 'Intermediate',
        summary: '''
This module builds on basic IT Project Management concepts by focusing on detailed planning, control, and coordination of projects.

Topics include:
• Project planning and scope definition  
• Importance of clear scope and preventing scope creep  
• Work Breakdown Structure (WBS) for task organization  
• Project scheduling and time management  
• Gantt charts and task dependencies  
• Project risk identification and risk management processes  
• Communication planning and stakeholder management  
• Monitoring and controlling project progress  

These topics help ensure IT projects are delivered on time, within budget, and with stakeholder support.
''',
        content:
            'An intermediate-level study of IT Project Management covering planning techniques, scheduling tools, risk management, communication strategies, and project monitoring.',
        
        youtubeUrl: 'https://youtu.be/kXkVV7PFWgE?si=YTohgcJmLUF4ygF1',
        
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=17mw4VALW0yfS-97h7u28Gfe91I0OcKNL',
      ),
    ],
  ),
];
