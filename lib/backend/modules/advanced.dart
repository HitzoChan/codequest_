import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'web_dev_advanced_clean',
    title: 'Web Development – Advanced',
    description:
        'Advanced concepts in modern web development, including architecture, APIs, asynchronous JavaScript, security, and version control.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'web_dev_advanced_ch1',
        title: 'Modern Web Architecture and Advanced Concepts',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced concepts used in building scalable and dynamic web applications.

Topics include:
• Modern Web Application Architecture: frontend, backend, and database layers
• APIs: how frontend and backend communicate
• REST Principles and HTTP Methods
• Asynchronous JavaScript: event loop, callbacks, promises, async/await
• Web Security Essentials: HTTPS, authentication, authorization, CORS
• Version Control: Git repositories, commits, branches, and collaboration

This module prepares learners for real-world development environments and professional workflows.
''',
        content:
            'A deep dive into the layered structure of web applications, API-driven communication, asynchronous programming techniques, security practices for protecting data, and version control workflows essential for team-based development.',
        youtubeUrl: 'https://www.youtube.com/watch?v=-MTSQjw5DrM',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1m045C2ZCIOVu4lW6ZLrMpPs7nKU2F7rd',
      ),
    ],
  ),
];
