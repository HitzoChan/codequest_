import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'se_beginner_clean',
    title: 'Software Engineering – Beginner',
    description:
        'Beginner module introducing Software Engineering, the SDLC, requirements, and foundational development principles.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'se_beginner_ch1',
        title: 'Introduction to Software Engineering & SDLC Foundations',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the core concepts of Software Engineering and explains why software projects require structured processes.

Topics include:
• What Software Engineering is and why it uses systematic, engineering-based approaches  
• Differences between Software Engineering and simple programming  
• The Software Development Life Cycle (SDLC) and its major phases such as planning, analysis, design, implementation, testing, deployment, and maintenance  
• Common SDLC models including Waterfall, Iterative, and Agile, and when each model is appropriate  
• The importance of software requirements in guiding development  
• Differences between functional and non-functional requirements  
• Techniques for gathering requirements such as interviews, surveys, observations, brainstorming, and prototypes  
• How Software Engineering principles improve quality, reduce risks, and support teamwork  

This module builds a strong foundation for beginners to understand how professional software is designed and managed.
''',
        content:
            'A beginner-friendly explanation of Software Engineering fundamentals, SDLC structure, requirement types, and the role of organized processes in building high-quality software systems.',
        youtubeUrl: 'https://www.youtube.com/watch?v=IHx9ImEMuzQ',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1x1z2LD-z9xdwimOfJKpxcpqf7d9sHVk4',
      ),
    ],
  ),
];
