import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'intro_computing_beginner_clean',
    title: 'Introduction to Computing – Beginner',
    description:
        'Beginner module introducing the fundamentals of computing, computer components, data and information, types of computers, and basic operations.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'intro_computing_beginner_ch1',
        title: 'Understanding Computers, Information, and Basic Digital Concepts',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the foundational ideas of computing and how computers are used to process information.

Topics include:
• What computing is and how it supports communication, problem-solving, and digital tasks  
• Components of a computer system including hardware, software, data, people, and processes  
• The difference between data and information and how computers transform one into the other  
• Basic types of computers such as personal computers, mobile devices, servers, and supercomputers  
• The four basic operations of a computer: input, processing, output, and storage  
• The importance of computing in society across business, education, healthcare, and daily life  

This module builds a strong foundation for understanding how modern computer systems function.
''',
        content:
            'A complete introduction to how computers work, the role of hardware and software, how data becomes information, the classification of computer types, and the essential operations that make computing possible in everyday life.',
        youtubeUrl: 'https://www.youtube.com/watch?v=l4plCAriwSs',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1xMAI4gCON2hZGjoHv1XewDLlXq3WHMF1',
      ),
    ],
  ),
];
