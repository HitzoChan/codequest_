import 'models.dart';

class IntermediateSQLQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'A LEFT JOIN returns:',
      choices: [
        'Only rows that match in both tables',
        'All rows from the left table and matched rows from the right table',
        'All rows from both tables, including unmatched',
        'Only unmatched rows',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A RIGHT JOIN is similar to a LEFT JOIN but:',
      choices: [
        'Prioritizes the right table instead of the left',
        'Removes all duplicates automatically',
        'Returns no NULL values',
        'Works only on numeric columns',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'A FULL OUTER JOIN returns:',
      choices: [
        'Only matched rows',
        'All rows from both tables, including unmatched rows',
        'Only rows without foreign keys',
        'Only records from the larger table',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A subquery is:',
      choices: [
        'A command used only for deleting data',
        'A query written inside another query',
        'A JOIN with three or more tables',
        'A database backup procedure',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Subqueries are useful when:',
      choices: [
        'A single SELECT statement cannot provide the needed result',
        'Working only with one table',
        'You want to disable constraints',
        'No filtering is needed',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'The purpose of an index is to:',
      choices: [
        'Slow down read operations',
        'Speed up searching and retrieving data',
        'Remove duplicate table rows',
        'Encrypt sensitive records',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A major trade-off of indexing is that:',
      choices: [
        'It increases storage and slows down write operations',
        'It prevents table joins',
        'It makes SELECT queries invalid',
        'It removes primary keys',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'A transaction ensures that:',
      choices: [
        'Multiple users cannot access the database',
        'Data updates follow ACID principles',
        'Backups are created automatically',
        'SQL statements are always faster',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The COMMIT command is used to:',
      choices: [
        'Undo all changes',
        'Save all operations in a transaction permanently',
        'Detect deadlocks',
        'Close the database connection',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Aliases in SQL help by:',
      choices: [
        'Creating permanent column names',
        'Temporarily renaming tables or columns to simplify queries',
        'Encrypting table names',
        'Removing JOIN conditions',
      ],
      correctIndex: 1,
    ),
  ];
}
