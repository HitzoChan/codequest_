import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'ai_intermediate_clean',
    title: 'Artificial Intelligence Fundamentals – Intermediate',
    description:
        'Intermediate module focusing on machine learning concepts, data preparation, model training, evaluation, and ethical considerations.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'ai_intermediate_ch1',
        title: 'Machine Learning Concepts and AI Model Development',
        difficultyLevel: 'Intermediate',
        summary: '''
This module builds on basic AI concepts by focusing on how intelligent systems learn from data.

Topics include:
• Machine learning and its role in artificial intelligence  
• Types of machine learning: supervised, unsupervised, and reinforcement learning  
• Data collection and data preparation processes  
• Importance of data quality in AI systems  
• Training and evaluating AI models  
• Splitting data into training and testing sets  
• Common machine learning algorithms  
• Ethical issues in machine learning such as bias and privacy  

These topics help learners understand how AI systems are developed, trained, and evaluated.
''',
        content:
            'An intermediate-level study of machine learning concepts, data preparation, model training and evaluation, common algorithms, and ethical considerations in AI.',

        youtubeUrl: 'https://youtu.be/Fa_V9fP2tpU?si=ZxJcrdBJiF1kejEr',

        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1t8P1zI6961WNUljrpLe__n7gmwXbatCV',
      ),
    ],
  ),
];
