import 'models.dart';

class WebDevIntermediateQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'What does the term “DOM” stand for in web development?',
      choices: [
        'Document Object Model',
        'Data Object Mapping',
        'Digital Output Module',
        'Document Oriented Management'
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Which HTML element is used to embed JavaScript in a webpage?',
      choices: [
        '<javascript>',
        '<script>',
        '<js>',
        '<code>'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which CSS layout module allows items to align horizontally or vertically with flexible space?',
      choices: [
        'Grid',
        'Block Layout',
        'Flexbox',
        'Float Layout'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'What is the purpose of the “async” keyword when loading external JavaScript?',
      choices: [
        'Loads the script only after the page is fully rendered',
        'Prevents the script from running',
        'Allows the script to load independently without blocking the page',
        'Combines multiple scripts into one'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which HTTP status code means “Unauthorized”?',
      choices: [
        '200',
        '301',
        '401',
        '404'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which method is used in JavaScript to select an element by its ID?',
      choices: [
        'querySelector()',
        'getElementById()',
        'getByID()',
        'selectId()'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'In CSS, what does “position: absolute;” do?',
      choices: [
        'Positions the element relative to the viewport',
        'Positions the element relative to its nearest positioned ancestor',
        'Centers the element horizontally',
        'Fixes the element at the bottom'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What is the purpose of JSON in web development?',
      choices: [
        'Styling webpages',
        'Storing and transferring data between systems',
        'Running server-side logic only',
        'Creating animations'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following is a semantic HTML element?',
      choices: [
        '<section>',
        '<div>',
        '<span>',
        '<b>'
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Which JavaScript feature allows you to write asynchronous code more cleanly?',
      choices: [
        'Callbacks only',
        'Async/Await',
        'HTML Templates',
        'CSS Variables'
      ],
      correctIndex: 1,
    ),
  ];
}

class SqlIntermediateQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'Which JOIN returns rows when there is a match in both tables?',
      choices: ['LEFT JOIN', 'RIGHT JOIN', 'INNER JOIN', 'FULL OUTER JOIN'],
      correctIndex: 2,
    ),
    QuizQuestion(
      question: 'What does the GROUP BY clause do?',
      choices: [
        'Filters rows before aggregation',
        'Aggregates rows that have the same values in specified columns',
        'Sorts the result set',
        'Limits the number of rows returned'
      ],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Which clause is used to filter groups created by GROUP BY?',
      choices: ['WHERE', 'HAVING', 'FILTER', 'MATCH'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'What is a correlated subquery?',
      choices: [
        'A subquery that depends on values from the outer query',
        'A subquery that runs independently',
        'A subquery used only for INSERTs',
        'A subquery that returns multiple columns only'
      ],
      correctIndex: 0,
    ),
    QuizQuestion(
      question: 'Which statement starts a transaction in most SQL dialects?',
      choices: ['BEGIN TRANSACTION', 'START QUERY', 'OPEN TRANSACTION', 'TRANSACTION BEGIN'],
      correctIndex: 0,
    ),
    QuizQuestion(
      question: 'What is the main purpose of an index in a database?',
      choices: [
        'To store backups',
        'To speed up data retrieval',
        'To encrypt data',
        'To normalize the schema'
      ],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Which normal form aims to remove transitive dependencies?',
      choices: ['1NF', '2NF', '3NF', 'BCNF'],
      correctIndex: 2,
    ),
    QuizQuestion(
      question: 'Which SQL function returns the number of rows in a result set?',
      choices: ['SUM()', 'COUNT()', 'ROWNUM()', 'LENGTH()'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Which clause would you use to ensure unique rows in a result set?',
      choices: ['UNIQUE', 'DISTINCT', 'GROUP', 'UNION ALL'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Which statement safely removes all rows but keeps the table structure and often is faster than DELETE without WHERE?',
      choices: ['REMOVE', 'DROP', 'TRUNCATE', 'CLEAR'],
      correctIndex: 2,
    ),
  ];
}
