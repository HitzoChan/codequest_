import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'sql_intermediate_clean',
    title: 'Advanced Database System (SQL 2) – Intermediate',
    description:
        'Intermediate module focusing on advanced SQL query techniques, performance optimization, and transaction management.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'sql_intermediate_ch1',
        title: 'Advanced JOINs, Subqueries, Indexing, and Transactions',
        difficultyLevel: 'Intermediate',
        summary: '''
This module builds on basic SQL knowledge by introducing more advanced querying and database management techniques.

Topics include:
• Advanced JOIN operations: LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN
• Retrieving complete datasets including matched and unmatched records
• Writing subqueries to handle complex and nested data requirements
• Improving query performance using indexes
• Understanding indexing trade-offs between read and write operations
• Managing database consistency using transactions
• ACID properties: Atomicity, Consistency, Isolation, and Durability
• Using aliases to simplify and improve the readability of complex SQL queries
''',
        content:
            'An intermediate-level exploration of SQL techniques used to combine multiple tables, structure complex queries with subqueries, optimize database performance through indexing, and ensure data integrity using transactions and ACID principles.',
        youtubeUrl: 'https://www.youtube.com/watch?v=7S_tz1z_5bA',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1FG3Peo7X8y1SyELTNTDf8n_iaFugCs8d',
      ),
    ],
  ),
];
