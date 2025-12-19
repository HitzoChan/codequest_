import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'ai_advanced_clean',
    title: 'Artificial Intelligence Fundamentals – Advanced',
    description:
        'Advanced module covering deep learning, neural networks, AI frameworks, deployment, and ethical AI.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'ai_advanced_ch1',
        title: 'Deep Learning, AI Deployment & Ethical AI',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced artificial intelligence concepts that enable machines to perform complex tasks.

Topics include:
• Deep learning and how it differs from basic machine learning  
• Neural networks inspired by the human brain  
• Hidden layers and feature learning  
• Training deep learning models using epochs and gradient descent  
• Challenges such as overfitting and model generalization  
• AI frameworks and libraries such as TensorFlow and PyTorch  
• Deployment of AI models into real-world applications  
• Ethical AI principles including fairness, transparency, and accountability  
• Explainable AI (XAI) and responsible AI use  

These topics prepare learners to design, deploy, and manage advanced AI systems responsibly.
''',
        content:
            'An advanced-level study of deep learning, neural networks, AI frameworks, model deployment, and ethical and explainable artificial intelligence.',
        
        youtubeUrl: 'https://youtu.be/oV3ZY6tJiA0?si=uAv-iMchUi7PnQaJ',
        
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=11TXAw-ZhpEGqKh4nzLgJ4wno1k9n6kXI',
      ),
    ],
  ),
];
