import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'info_mgmt_intermediate_clean',
    title: 'Information Management – Intermediate',
    description:
        'Intermediate module explaining databases, DBMS, data models, relational structures, keys, and ERD fundamentals.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'info_mgmt_intermediate_ch1',
        title: 'Databases, DBMS, and Data Modeling',
        difficultyLevel: 'Intermediate',
        summary: '''
This module explains how data is organized, stored, managed, and modeled within information systems.

Topics include:
• The purpose and importance of databases for storing and organizing data  
• What a Database Management System (DBMS) does, including access control, security, and backup  
• Data models such as hierarchical, network, object-oriented, and the widely used relational model  
• Relational database concepts including tables, attributes, records, primary keys, and foreign keys  
• Entity–Relationship Diagrams (ERDs) for designing and understanding database structures  
• The role of databases in supporting accuracy, security, data consistency, and organizational decision-making  

This module strengthens understanding of how structured information is modeled and maintained in modern systems.
''',
        content:
            'A detailed discussion of database concepts, DBMS functions, relational structures, keys, and ERD modeling. It explains why databases are essential for ensuring data consistency, accuracy, and secure access across organizational processes.',
        youtubeUrl: 'https://www.youtube.com/watch?v=wR0jg0eQsZA',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1fMVIosh0OLTCCpTPeGyKvqGapWdpYkYX',
      ),
    ],
  ),
];
