import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'sysint_intermediate_clean',
    title: 'System Integration & Architecture – Intermediate',
    description:
        'Intermediate module covering architectural models, layered design, client–server systems, middleware, APIs, and data flow in integrated systems.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'sysint_intermediate_ch1',
        title: 'Architectural Models, Middleware, and Data Flow',
        difficultyLevel: 'Intermediate',
        summary: '''
This module introduces common architectural models and integration tools used to design structured and well-organized information systems.

Topics include:
• Architectural models and how they organize system components  
• Layered architecture and the separation of presentation, logic, and data access  
• Client–server architecture and centralized management of applications  
• The role of middleware in enabling communication between independent systems  
• APIs as standardized interfaces for exchanging data  
• Data flow across integrated systems and the use of diagrams to visualize information movement  

The module provides a deeper understanding of how integrated systems are designed and how information moves efficiently across components.
''',
        content:
            'A detailed explanation of how architectural models support organized system design, the structure and purpose of layered and client–server models, the role of middleware and APIs in system integration, and how data flows through multi-layered environments in modern information systems.',
        youtubeUrl: 'https://www.youtube.com/watch?v=5uq5wCCXvwU',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1uvNOUFR7JgiEOMSo4C7OJffoZEYse5K8',
      ),
    ],
  ),
];
