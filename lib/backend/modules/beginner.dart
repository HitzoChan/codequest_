import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'programming_beginner_clean',
    title: 'Computer Programming – Beginner',
    description:
        'Beginner module introducing programming basics, syntax, variables, data types, control flow, algorithms, debugging, and the programming process.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'programming_beginner_ch1',
        title: 'Introduction to Programming and Core Concepts',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the foundational concepts of computer programming and how computers interpret instructions.

Topics include:
• What computer programming is and why it is important  
• Programming languages and syntax  
• High-level vs low-level languages  
• Variables, data types, and basic operators  
• Control structures: conditionals and loops  
• Algorithms and structured problem-solving  
• Debugging and identifying program errors  
• The programming process: planning, coding, testing, and improving  

This module provides the essential building blocks needed before moving into more advanced programming topics.
''',
        content:
            'A complete explanation of programming fundamentals including syntax rules, variable usage, data types, basic logic structures, and debugging methods. It also covers the structured programming process and the role of algorithms in solving problems efficiently.',
        youtubeUrl: 'https://www.youtube.com/watch?v=zOjov-2OZ0E',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1ltWHRRxwEK9yDCzpN-yNAmWLwFIuhS37',
      ),
    ],
  ),
];
