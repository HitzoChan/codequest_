import 'models.dart';

class AdvancedAIQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Deep learning differs from basic machine learning because it:',
      choices: [
        'Uses only small datasets',
        'Relies on multi-layered neural networks',
        'Does not require training',
        'Works without algorithms',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Neural networks are inspired by:',
      choices: [
        'Computer hardware design',
        'The structure of the human brain',
        'Internet architecture',
        'Database systems',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Hidden layers in a neural network are used to:',
      choices: [
        'Store raw data',
        'Learn complex patterns and features',
        'Replace training data',
        'Display outputs',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'An epoch in deep learning refers to:',
      choices: [
        'A single neuron',
        'One complete pass of training data through the model',
        'A testing phase',
        'A deployment step',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Gradient descent is used to:',
      choices: [
        'Increase model errors',
        'Optimize model parameters by minimizing loss',
        'Encrypt AI models',
        'Transfer data',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'TensorFlow and PyTorch are examples of:',
      choices: [
        'Operating systems',
        'AI frameworks and libraries',
        'Programming languages',
        'Databases',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Overfitting occurs when a model:',
      choices: [
        'Performs well on new data',
        'Learns training data too closely and fails to generalize',
        'Has too little data',
        'Trains too quickly',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Deploying AI models involves:',
      choices: [
        'Storing them offline only',
        'Integrating trained models into real applications or services',
        'Removing evaluation processes',
        'Ignoring performance monitoring',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Ethical AI emphasizes:',
      choices: [
        'Faster execution only',
        'Fairness, transparency, and accountability',
        'Eliminating human involvement',
        'Maximum automation at any cost',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Explainable AI (XAI) focuses on:',
      choices: [
        'Making AI systems faster',
        'Making AI decisions understandable to humans',
        'Removing neural networks',
        'Hiding model logic',
      ],
      correctIndex: 1,
    ),

  ];
}
