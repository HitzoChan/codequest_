import 'models.dart';

class AdvancedSQLQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'A stored procedure is best described as:',
      choices: [
        'A temporary SQL query',
        'A precompiled set of SQL statements stored in the database',
        'A type of user-created index',
        'An automatically triggered update',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Stored procedures improve performance because they:',
      choices: [
        'Delete unused tables',
        'Execute on the client side',
        'Reduce network traffic and are precompiled',
        'Run slower but more securely',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A trigger is activated:',
      choices: [
        'When a user logs into the DBMS',
        'Automatically when an INSERT, UPDATE, or DELETE occurs',
        'Only when the database restarts',
        'Manually by the administrator',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'One common use of a trigger is to:',
      choices: [
        'Improve user interface design',
        'Automatically enforce business rules or maintain audit logs',
        'Create backups of the database',
        'Format output results',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A view is:',
      choices: [
        'A physical table storing its own data',
        'A saved SQL query that behaves like a virtual table',
        'A system file for indexing',
        'A table that cannot be queried',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Views are useful because they:',
      choices: [
        'Store data faster than tables',
        'Hide complex queries and restrict access to sensitive columns',
        'Replace primary keys',
        'Eliminate the need for joins',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Query optimization aims to:',
      choices: [
        'Make SQL queries harder to read',
        'Improve query performance and reduce resource usage',
        'Increase the number of tables stored',
        'Disable indexing',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following helps improve SQL performance?',
      choices: [
        'Selecting only necessary columns instead of using SELECT *',
        'Running the same subquery repeatedly',
        'Creating excessive indexes on all columns',
        'Avoiding JOINs entirely',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Savepoints in transactions allow:',
      choices: [
        'Full rollback only',
        'Partial rollbacks to specific points within a transaction',
        'Automatic optimization of queries',
        'Encryption of transaction logs',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Isolation levels in transactions are used to:',
      choices: [
        'Control how concurrent transactions interact',
        'Increase storage space',
        'Remove foreign keys',
        'Manage network connections',
      ],
      correctIndex: 0,
    ),
  ];
}
