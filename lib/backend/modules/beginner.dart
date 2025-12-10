import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'web_dev_beginner_clean',
    title: 'Web Development – Beginner',
    description:
        'Beginner module introducing the fundamentals of how websites are created, displayed, and maintained.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'web_dev_beginner_ch1',
        title: 'Introduction to Web Development',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the fundamentals of web development.

Topics include:
• What web development is and its importance
• Components of a website: HTML for structure, CSS for design, JavaScript for interactivity
• How the web works: browsers, servers, and URLs
• Types of websites: static vs dynamic
• Essential developer tools such as code editors and browser devtools
• Why web development remains a vital skill in the digital era
''',
        content:
            'A beginner-friendly explanation of website structure, how browsers and servers communicate, the role of HTML/CSS/JavaScript, and essential tools used by developers.',
        youtubeUrl: 'https://www.youtube.com/watch?v=3JluqTojuME',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1BZQrP_Ys4Aafu0e7NmfP7oknG5-fCQ58',
      ),
    ],
  ),
];
