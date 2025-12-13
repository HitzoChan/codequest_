import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'sql_advanced_clean',
    title: 'Advanced Database System (SQL 2) – Advanced',
    description:
        'Advanced module focusing on programmable database objects, performance optimization, and advanced transaction control.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'sql_advanced_ch1',
        title: 'Stored Procedures, Triggers, Views, and Query Optimization',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced SQL features used in enterprise-level database systems.

Topics include:
• Stored procedures and their role in automating and securing database operations
• Performance benefits of precompiled SQL logic
• Triggers for automatic execution during INSERT, UPDATE, and DELETE events
• Enforcing business rules and maintaining audit logs using triggers
• Views as virtual tables for simplifying queries and restricting sensitive data
• Query optimization techniques to improve performance and reduce resource usage
• Index usage strategies and avoiding inefficient query patterns
• Advanced transaction management using savepoints and isolation levels
• Managing concurrency and data consistency in multi-user environments
''',
        content:
            'An advanced-level discussion of SQL programming objects such as stored procedures, triggers, and views, combined with query optimization techniques and advanced transaction controls to ensure performance, security, and data integrity in complex database systems.',
        youtubeUrl: 'https://www.youtube.com/watch?v=AOeM7gGXirQ',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1fX4a95sfes7p_tq-0NoawoQYd9-RVg87',
      ),
    ],
  ),
];
