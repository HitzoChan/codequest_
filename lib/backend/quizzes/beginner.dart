import 'models.dart';

class BeginnerSQLQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'SQL is primarily used to:',
      choices: [
        'Build user interfaces',
        'Manage and query relational databases',
        'Create operating systems',
        'Design websites',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The SELECT statement is used to:',
      choices: [
        'Delete tables',
        'Retrieve data from a database',
        'Change user passwords',
        'Encrypt stored data',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The INSERT command is used when:',
      choices: [
        'Removing rows',
        'Adding new records into a table',
        'Searching for records',
        'Sorting data',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The UPDATE command modifies:',
      choices: [
        'Column names',
        'Table structures',
        'Existing records in a table',
        'Only primary keys',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A primary key must:',
      choices: [
        'Allow duplicate values',
        'Be NULL when needed',
        'Uniquely identify each record',
        'Change automatically every day',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A foreign key is used to:',
      choices: [
        'Ensure a table has no duplicates',
        'Link one table to another',
        'Store encrypted passwords',
        'Remove table constraints',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'An INNER JOIN returns:',
      choices: [
        'All records from both tables regardless of matches',
        'Only rows with matching values in both tables',
        'Only unmatched rows',
        'Only records from the first table',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The DELETE command removes:',
      choices: [
        'A full database',
        'Specific rows from a table',
        'Only constraints',
        'System logs',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A NOT NULL constraint ensures that:',
      choices: [
        'A column cannot be left empty',
        'Duplicates are allowed',
        'A column stores only numbers',
        'Values reset automatically',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Constraints in a database are used to:',
      choices: [
        'Increase storage size',
        'Enforce rules and maintain data integrity',
        'Slow down database performance',
        'Hide columns from users',
      ],
      correctIndex: 1,
    ),
  ];
}
