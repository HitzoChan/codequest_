import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'integrative_programming_advanced_clean',
    title: 'Integrative Programming – Advanced',
    description:
        'Advanced module covering integration architectures, microservices, distributed systems, API management, event-driven design, containerization, CI/CD pipelines, and security.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'ip_advanced_ch1',
        title: 'Advanced Integration Architecture & Enterprise-Scale Systems',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores modern enterprise integration concepts and technologies used to build scalable, distributed, and secure applications.

Topics include:
• Advanced integration architecture and how large systems connect diverse services  
• Microservices design: independent, modular services communicating via lightweight APIs  
• Distributed systems for reliability, scalability, and high availability  
• API management for securing, monitoring, and controlling API consumption  
• Orchestration tools for automating service interactions and workflows  
• Event-driven integration using real-time event triggers and messaging platforms  
• Containerization using Docker/Kubernetes for consistent deployment  
• CI/CD pipelines for automated testing, integration, and delivery  
• Security approaches including authentication, authorization, encryption, and zero-trust principles  

This module prepares learners for developing, managing, and securing large-scale integrated applications.
''',
        content:
            'A comprehensive discussion on advanced integration models, microservices, distributed architectures, API management, orchestration, event-driven systems, containerization, deployment pipelines, and enterprise security. The module emphasizes scalability, automation, and resilience in modern integrated applications.',
        youtubeUrl: 'https://www.youtube.com/watch?v=1xo-0gCVhTU',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1CZPUufm853xJvQaheF2pp1MeM5vvUKhA',
      ),
    ],
  ),
];
