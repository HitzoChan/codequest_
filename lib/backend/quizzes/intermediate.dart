import 'models.dart';

class IntermediateDataAnalyticsQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Primary data collection is best described as:',
      choices: [
        'Using existing reports from other organizations',
        'Collecting information directly from original sources',
        'Automatically generating data from software',
        'Copying data from online articles',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Secondary data must be evaluated carefully because:',
      choices: [
        'It is always inaccurate',
        'It may not be relevant or up to date',
        'It requires no processing',
        'It is more expensive to obtain',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The main purpose of data cleaning is to:',
      choices: [
        'Increase the size of datasets',
        'Introduce more variables',
        'Remove errors and prepare data for analysis',
        'Generate visual charts automatically',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A dataset containing duplicates, missing values, and inconsistent formats needs:',
      choices: [
        'Data visualization',
        'Data collection',
        'Data cleaning',
        'Statistical modeling',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Exploratory Data Analysis (EDA) helps analysts:',
      choices: [
        'Create final business reports',
        'Understand patterns and detect anomalies in the data',
        'Replace missing data automatically',
        'Encrypt sensitive information',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following is commonly used in EDA to summarize data?',
      choices: [
        'Antivirus software',
        'Descriptive statistics',
        'Audio processing tools',
        'Hardware drivers',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Data visualization is important because it:',
      choices: [
        'Converts images into numbers',
        'Makes complex data easier to understand',
        'Replaces the need for analysis',
        'Removes errors from datasets',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A histogram is most useful for showing:',
      choices: [
        'The distribution of numerical data',
        'The total number of database tables',
        'The details of text-based documents',
        'The structure of an organization',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Mean, median, and mode are examples of:',
      choices: [
        'Data collection methods',
        'Measures of central tendency',
        'Data encryption techniques',
        'Programming languages',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Why is proper data preparation essential for analysis?',
      choices: [
        'It guarantees higher internet speed',
        'It ensures accurate and meaningful results',
        'It eliminates the need for visualization',
        'It replaces statistical tools entirely',
      ],
      correctIndex: 1,
    ),

  ];
}
