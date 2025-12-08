import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'web_dev_pdf_01',
    title: 'Introduction to Web Development',
    description:
        'Beginner module based entirely on Chapter 1 of the uploaded Web Development PDF.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'web_dev_ch1_pdf',
        title: 'Introduction to Web Development',
        summary: '''
A beginner-friendly module covering the fundamentals of Web Development.

This module introduces:
• What Web Development is and why it is important
• Front-end, back-end, and full-stack roles
• Components of a website (HTML, CSS, JavaScript)
• How the web works (browsers, servers, URLs, request–response cycle)
• Types of websites (static vs dynamic)
• Essential web development tools (VS Code, DevTools)
• The importance of web development in today’s digital world
''',
        content:
            'An overview of how websites are built, how browsers and servers communicate, the roles of front-end and back-end development, essential tools, and the significance of modern web technologies.',
        youtubeUrl: 'https://www.youtube.com/watch?v=3JluqTojuME',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1BZQrP_Ys4Aafu0e7NmfP7oknG5-fCQ58',
      ),
    ],
  ),
];
