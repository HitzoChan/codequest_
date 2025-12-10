import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'intro_computing_advanced_clean',
    title: 'Introduction to Computing – Advanced',
    description:
        'Advanced module covering computer architecture, system performance, resource management, parallel and distributed computing, and emerging technologies.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'intro_computing_advanced_ch1',
        title: 'Computer Architecture, Performance, and Advanced Computing Paradigms',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced concepts that define how modern computer systems achieve performance, efficiency, and scalability.

Topics include:
• Computer architecture and how system components interact  
• Instruction Set Architecture (ISA) and its role in hardware–software communication  
• CPU design principles including multicore processors, pipelining, caching, and optimization  
• Memory hierarchy and system performance management  
• System software resource management through scheduling, concurrency, and load balancing  
• Parallel and distributed computing for high-performance applications  
• Emerging computing trends such as quantum computing, AI-driven systems, edge computing, and green computing  

This module prepares learners to understand, evaluate, and optimize modern computing environments.
''',
        content:
            'A comprehensive discussion of advanced architecture concepts, CPU performance techniques, memory hierarchy, resource management in system software, parallel and distributed computing models, and new paradigms such as quantum computing and edge computing that shape the future of technology.',
        youtubeUrl: 'https://www.youtube.com/watch?v=zlX8cpvOW7U',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1FBe97Jrf7l8-HoHmuSiBmGZQm151oAms',
      ),
    ],
  ),
];
