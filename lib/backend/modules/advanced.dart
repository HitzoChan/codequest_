import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'sysint_advanced_clean',
    title: 'System Integration & Architecture – Advanced',
    description:
        'Advanced module covering enterprise architecture, integration patterns, SOA, microservices, interoperability, and scalability in complex systems.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'sysint_advanced_ch1',
        title: 'Enterprise Architecture, Integration Patterns, and Scalability',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced concepts used to design and manage complex integrated systems.

Topics include:
• Enterprise Architecture (EA) and how it aligns technology with organizational goals  
• Enterprise frameworks such as TOGAF for structured planning and evaluation  
• Integration patterns including point-to-point, hub-and-spoke, and ESB  
• Service-Oriented Architecture (SOA) and reusable, loosely coupled services  
• Microservices as independently deployable components supporting flexibility and scalability  
• Interoperability and the use of standards like XML, JSON, REST, and SOAP  
• Scalability strategies and performance considerations in large integrated environments  

This module prepares learners for designing resilient, future-ready enterprise systems.
''',
        content:
            'A comprehensive explanation of enterprise architecture principles, advanced integration patterns, service-oriented and microservices architectures, the role of interoperability and data standards, and scalability strategies essential for modern enterprise environments.',
        youtubeUrl: 'https://www.youtube.com/watch?v=9TVc32M_gIY',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1FI_QfX4hTTIFXW_JULGdR_K-ahiPEv4f',
      ),
    ],
  ),
];
