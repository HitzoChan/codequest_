import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'data_analytics_advanced_clean',
    title: 'Data Analytics – Advanced',
    description:
        'Advanced module covering predictive modeling, machine learning, regression, classification, model evaluation, and ethical data analytics.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'data_analytics_advanced_ch1',
        title: 'Predictive Modeling, Machine Learning, and Ethical Analytics',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced analytical techniques used for forecasting, decision-making, and model evaluation.

Topics include:
• Predictive analytics and forecasting using historical data  
• Fundamentals of machine learning and its major categories  
• Regression and classification models for numerical and categorical prediction  
• Model evaluation techniques including accuracy, precision, recall, and error metrics  
• Overfitting, generalization, and validation strategies  
• Ethical analytics, fairness, transparency, and responsible data handling  

The module equips learners with the skills needed to analyze complex datasets and build reliable, responsible predictive models.
''',
        content:
            'A comprehensive discussion of predictive modeling, machine learning approaches, regression and classification techniques, model performance evaluation, and ethical considerations that ensure analytical systems are accurate, fair, and trustworthy.',
        youtubeUrl: 'https://www.youtube.com/watch?v=ukzFI9rgwfU',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1v_72jEdYCk3tJPCMUmrEYzV7mtuVqtEP',
      ),
    ],
  ),
];
