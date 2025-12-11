import 'models.dart';

class AdvancedInformationManagementQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'What is the primary purpose of normalization in database design?',
      choices: [
        'To make tables larger',
        'To increase redundancy',
        'To reduce duplication and improve data integrity',
        'To improve network bandwidth',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which of the following best describes a transitive dependency?',
      choices: [
        'When a table has no primary key',
        'When an attribute depends on another non-key attribute',
        'When all attributes depend fully on a composite key',
        'When records are duplicated across tables',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which SQL category contains commands such as CREATE and ALTER?',
      choices: [
        'DML',
        'DCL',
        'DDL',
        'TCL',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'The SQL command used to retrieve data from a table is:',
      choices: [
        'INSERT',
        'UPDATE',
        'DELETE',
        'SELECT',
      ],
      correctIndex: 3,
    ),

    QuizQuestion(
      question: 'In relational databases, a foreign key is used to:',
      choices: [
        'Generate a unique identifier for each row',
        'Link one table to another table',
        'Sort rows alphabetically',
        'Remove duplicate records',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which type of join retrieves only the matching records between two tables?',
      choices: [
        'Full Join',
        'Left Join',
        'Inner Join',
        'Cross Join',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'The ACID property that ensures all steps of a transaction succeed or fail together is:',
      choices: [
        'Durability',
        'Atomicity',
        'Isolation',
        'Consistency',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which DBMS feature protects data when multiple users attempt to modify it simultaneously?',
      choices: [
        'Data formatting',
        'Concurrency control',
        'Table indexing',
        'Record sorting',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The primary reason organizations enforce integrity constraints is to:',
      choices: [
        'Increase data redundancy',
        'Prevent unauthorized access to servers',
        'Maintain accuracy and consistency of data',
        'Speed up hardware performance',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A SQL JOIN is used when:',
      choices: [
        'Updating the physical structure of a database',
        'Creating new data types',
        'Retrieving related data from multiple tables',
        'Formatting the display layout of a report',
      ],
      correctIndex: 2,
    ),

  ];
}
