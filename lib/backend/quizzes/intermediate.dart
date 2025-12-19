import 'models.dart';

class IntermediateAIQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Machine learning allows AI systems to:',
      choices: [
        'Follow fixed rules only',
        'Learn patterns from data and improve over time',
        'Work without any data',
        'Replace all human decisions',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which type of machine learning uses labeled data?',
      choices: [
        'Unsupervised learning',
        'Reinforcement learning',
        'Supervised learning',
        'Random learning',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Unsupervised learning is mainly used to:',
      choices: [
        'Predict known outcomes',
        'Discover hidden patterns or groupings in data',
        'Control hardware devices',
        'Encrypt information',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Reinforcement learning works by:',
      choices: [
        'Memorizing datasets',
        'Learning through rewards and penalties',
        'Using labeled training data only',
        'Eliminating trial and error',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Data preparation includes:',
      choices: [
        'Ignoring missing values',
        'Cleaning, transforming, and organizing data',
        'Running algorithms without data',
        'Removing all data errors automatically',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Why is data quality important in AI systems?',
      choices: [
        'Poor data improves accuracy',
        'High-quality data leads to better model performance',
        'Data quality has no effect on AI',
        'Models do not depend on data',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Model evaluation is done to:',
      choices: [
        'Increase training time',
        'Measure how well a model performs on new data',
        'Remove algorithms',
        'Store data permanently',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Splitting data into training and testing sets helps:',
      choices: [
        'Reduce data size',
        'Evaluate how well the model generalizes',
        'Increase memory usage',
        'Eliminate the need for algorithms',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which is a common machine learning algorithm?',
      choices: [
        'Decision tree',
        'Web server',
        'Firewall',
        'Router',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Ethical issues in machine learning include:',
      choices: [
        'Faster processing speeds',
        'Data bias and privacy concerns',
        'Improved accuracy',
        'Larger datasets',
      ],
      correctIndex: 1,
    ),

  ];
}
