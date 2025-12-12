import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'se_intermediate_clean',
    title: 'Software Engineering – Intermediate',
    description:
        'Intermediate module covering software design, UML modeling, architecture, design patterns, project planning, and risk management.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'se_intermediate_ch1',
        title: 'Software Design, UML Modeling, Architecture & Project Management',
        difficultyLevel: 'Intermediate',
        summary: '''
This module explores how software systems are designed, structured, visualized, and managed throughout development.

Topics include:
• The purpose of software design and its role in converting requirements into blueprints  
• High-level design (architecture, components) and low-level design (algorithms, data structures)  
• UML modeling tools including use case diagrams, class diagrams, and sequence diagrams  
• Software architecture styles such as layered, client–server, and microservices  
• Design patterns as reusable solutions to common software problems  
• Project planning through task breakdown, scheduling, estimation, and resource allocation  
• Risk management strategies that identify uncertainties and prepare mitigation plans  

This module strengthens analytical, organizational, and visualization skills essential for professional software development.
''',
        content:
            'A detailed exploration of structured software design, UML diagrams, architectural principles, design patterns, project planning, and risk management, helping learners transition from requirements to well-organized system implementations.',
        youtubeUrl: 'https://www.youtube.com/watch?v=ZKOL-rZ79gs',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1b1uVttyV0rbFKNf2qSykmrH_EZI5EXJo',
      ),
    ],
  ),
];
