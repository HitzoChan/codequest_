import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'web_dev_advanced_pdf_v2',
    title: 'Web Development – Advanced',
    description:
        'Advanced web development module based on the newly provided PDF: deepening understanding of modern web architecture, security, APIs, asynchronous behavior, and performance best practices.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'web_dev_adv_from_pdf',
        title: 'Advanced Web Dev Architecture, APIs, Security & Performance',
        summary: '''
This advanced module covers:

• Modern Web Architecture (client-server, REST APIs, microservices)  
• API Communication & Data Handling (JSON, HTTP methods, status codes)  
• Asynchronous Web Programming (AJAX/fetch, promises, async/await, event loop)  
• Web Security Fundamentals (HTTPS, CORS, authentication/authorization, secure headers)  
• Performance & Optimization (minification, caching, lazy loading, efficient resource handling)  
• Version Control & Collaboration (using Git / GitHub, branching, merging, pull requests)  
• Best Practices for Production Web Apps (clean code, project structure, scalability, maintenance)  
''',
        content:
            'An advanced-level walkthrough of how modern web applications are structured, how front-end and back-end communicate via APIs, principles of asynchronous operations, security considerations, and performance optimizations — equipping learners to build production-ready web applications.',
        youtubeUrl: 'https://www.youtube.com/watch?v=7YcW25PHnAA',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1m045C2ZCIOVu4lW6ZLrMpPs7nKU2F7rd',
        orderIndex: 1,
        difficultyLevel: 'Advanced',
      ),
    ],
  ),
];
