import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'programming_intermediate_clean',
    title: 'Computer Programming – Intermediate',
    description:
        'Intermediate module covering control structures, modular programming, arrays, file handling, and developing structured program solutions.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'programming_intermediate_ch1',
        title: 'Control Structures, Functions, Arrays, and File Handling',
        difficultyLevel: 'Intermediate',
        summary: '''
This module expands beginner programming skills by introducing more advanced logic and structured program design.

Topics include:
• Control structures for directing program flow, including nested conditionals and multiple branches  
• Use of loops such as for loops, while loops, and nested loops for repetitive tasks  
• Modular programming through functions to enhance reusability and code organization  
• Parameters and return values for passing data between program components  
• Arrays for storing multiple values under one variable and processing data sets  
• Basic file handling for reading and writing external data  
• Combining loops, functions, arrays, and file handling to solve real-world problems  

This module strengthens logical thinking, improves code organization, and prepares learners for advanced programming topics.
''',
        content:
            'A detailed explanation of intermediate programming concepts such as advanced control structures, modular design, parameterized functions, array manipulation, and file handling operations. It emphasizes writing organized, reusable, and efficient code for practical applications.',
        youtubeUrl: 'https://www.youtube.com/watch?v=8PopR3x-VMY',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1lWq9hmbite-6FVCvfTqi0GfLQ0NLKUcU',
      ),
    ],
  ),
];
