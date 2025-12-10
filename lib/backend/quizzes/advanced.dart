import 'models.dart';

class AdvancedDataAnalyticsQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Predictive analytics is primarily used to:',
      choices: [
        'Describe past events',
        'Categorize data into groups',
        'Forecast future outcomes based on historical patterns',
        'Store raw information in databases',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Machine learning differs from traditional programming because it:',
      choices: [
        'Requires no data at all',
        'Learns patterns automatically from examples',
        'Only works with text-based information',
        'Cannot be used for prediction',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'In supervised learning, models are trained using:',
      choices: [
        'Randomized numeric outputs',
        'Unlabeled data',
        'Trial-and-error rewards',
        'Labeled data',
      ],
      correctIndex: 3,
    ),

    QuizQuestion(
      question: 'Unsupervised learning is best used when the goal is to:',
      choices: [
        'Predict the price of a product',
        'Classify emails as spam or not spam',
        'Discover hidden patterns or groups in data',
        'Perform arithmetic operations',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Regression models are used to predict:',
      choices: [
        'Numerical values',
        'Categories',
        'Geographical locations',
        'Passwords',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Classification models are most appropriate when the outcome is:',
      choices: [
        'A continuous number',
        'A category or label',
        'An image or video file',
        'A mathematical equation',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which metric is commonly used to evaluate classification models?',
      choices: [
        'Mean Absolute Error',
        'Precision',
        'Standard Deviation',
        'Variance',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Overfitting occurs when a model:',
      choices: [
        'Performs well on both training and new data',
        'Is too simple to capture important patterns',
        'Performs well on training data but poorly on new data',
        'Uses too little data for training',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Ethical data analytics requires that:',
      choices: [
        'Data be used freely without restriction',
        'Personal information be analyzed without consent',
        'Models avoid reinforcing bias and unfair outcomes',
        'Analysts hide how models make predictions',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Transparency in analytics means:',
      choices: [
        'Allowing anyone to modify the database',
        'Explaining clearly how data is used and how decisions are made',
        'Publishing all private information',
        'Encrypting every dataset',
      ],
      correctIndex: 1,
    ),

  ];
}
