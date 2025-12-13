import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'sql_beginner_clean',
    title: 'Advanced Database System (SQL 2) – Beginner',
    description:
        'Beginner module introducing core SQL concepts, data manipulation, and basic table relationships.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'sql_beginner_ch1',
        title: 'Introduction to SQL Basics and Table Relationships',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the foundational concepts of SQL used in relational database systems.

Topics include:
• Purpose and importance of SQL in database management
• Retrieving data using SELECT statements
• Adding, updating, and deleting records using INSERT, UPDATE, and DELETE
• Understanding primary keys and foreign keys
• Linking tables using basic INNER JOIN concepts
• Using constraints such as NOT NULL to maintain data integrity
• Why structured databases are essential for real-world applications
''',
        content:
            'A beginner-level overview of how SQL is used to manage relational databases, manipulate data, define relationships between tables, and enforce rules that keep data accurate and consistent.',
        youtubeUrl: 'https://www.youtube.com/watch?v=HXV3zeQKqGY',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1w_f-ImdW7xdU4v3peVMICxBumTCXt_78',
      ),
    ],
  ),
];
