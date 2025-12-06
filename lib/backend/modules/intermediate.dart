import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'mobile_dev_101_intermediate',
    title: 'Mobile Dev - Intermediate',
    description: 'Intermediate modules for mobile development.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'web_development_01',
        title: 'Web Development Basics',
        content: '''
    This module introduces the foundations of modern web development, based on essential HTML, CSS, and JavaScript learning materials.

    It covers core topics such as:
    • Introduction to the Web (how websites work, clients & servers)
    • HTML Fundamentals (structure, tags, semantic markup)
    • CSS Styling (selectors, colors, layout, flexbox, grid)
    • Responsive Design (media queries, mobile-first approach)
    • JavaScript Basics (variables, functions, DOM manipulation)
    • Events & User Interactions
    • Introduction to Web Hosting & Deployment
    • Best Practices (clean code, accessibility, file organization)
    ''',
        orderIndex: 4,
        difficultyLevel: 'Intermediate',
        youtubeUrl: 'https://youtu.be/qz0aGYrrlhU?si=LLpFCrGV9YxNXOvy',
        summary: 'This module provides a foundational introduction to web development.',
        pdfUrl: 'https://www.w3.org/WAI/ER/tools/complete/',
      ),
    ],
  ),
];
