import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'info_mgmt_advanced_clean',
    title: 'Information Management – Advanced',
    description:
        'Advanced module covering normalization, SQL foundations, joins, ACID transactions, concurrency control, and enterprise-level data integrity concepts.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'info_mgmt_advanced_ch1',
        title: 'Advanced Database Design, SQL, and Data Integrity',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced database concepts used to ensure accuracy, stability, and efficiency in large information systems.

Topics include:
• Data redundancy, integrity rules, and why they matter in enterprise environments  
• Normalization principles including 1NF, 2NF, and 3NF  
• SQL foundations: DDL, DML, DCL, and TCL command categories  
• Relational queries, joins, and linking tables using keys  
• ACID transactions and why they ensure safe multi-step operations  
• Concurrency control for multi-user environments  
• Importance of advanced database concepts in organizational information systems  

This module strengthens analytical and technical skills needed for managing modern relational databases.
''',
        content:
            'A comprehensive explanation of normalization, SQL command groups, relational joins, ACID properties, and concurrency control. The module highlights how advanced database design improves consistency, reduces redundancy, and enables secure multi-user data management.',
        youtubeUrl: 'https://www.youtube.com/watch?v=GFQaEYEc8_8',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1kkwohN2Y4NVzumutyBjI3vwe2kxBFTl_',
      ),
    ],
  ),
];
