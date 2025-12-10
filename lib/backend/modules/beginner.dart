import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'data_analytics_beginner_clean',
    title: 'Data Analytics – Beginner',
    description:
        'Beginner module introducing the fundamentals of data analytics, data types, analysis processes, tools, and ethical use of data.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'data_analytics_beginner_ch1',
        title: 'Introduction to Data Analytics',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the essential concepts of data analytics and how organizations use data to guide decisions.

Topics include:
• Understanding data analytics and its importance in modern industries  
• Types of data: qualitative, quantitative, structured, unstructured, and semi-structured  
• The data analytics process, including collection, cleaning, exploration, analysis, and interpretation  
• Tools used for organizing, visualizing, and analyzing data  
• Ethical considerations and responsible data handling  

The module builds foundational knowledge that helps learners understand how insights are derived from raw information.
''',
        content:
            'A clear overview of data analytics fundamentals, classifications of data, the step-by-step analytics process, commonly used tools such as Excel and visualization platforms, and ethical practices required when working with sensitive information.',
        youtubeUrl: 'https://www.youtube.com/watch?v=yZvFH7B6gKI',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1JontR0hKHWXLHy4vbkZbFRMYa53dFgpP',
      ),
    ],
  ),
];
