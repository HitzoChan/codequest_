import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'ai_beginner_clean',
    title: 'Artificial Intelligence Fundamentals – Beginner',
    description:
        'Beginner module introducing artificial intelligence concepts, types of AI, core components, applications, and limitations.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'ai_beginner_ch1',
        title: 'Introduction to Artificial Intelligence',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the basic concepts of Artificial Intelligence (AI) and how intelligent systems work.

Topics include:
• Definition of Artificial Intelligence  
• History and evolution of AI  
• Types of AI: Narrow AI and General AI  
• Core components of AI systems such as data, algorithms, and models  
• Common AI applications like voice assistants and recommendation systems  
• Benefits and limitations of artificial intelligence  
• Importance of learning AI fundamentals  

These topics help learners understand how AI systems simulate human intelligence and impact daily life.
''',
        content:
            'A beginner-level overview of artificial intelligence covering definitions, types of AI, core concepts, applications, and limitations.',
        
        youtubeUrl: 'https://youtu.be/ad79nYk2keg?si=S7EjrwYhqCifkdgl',

        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1wTBA1j1G7t0ZoxLf9Kn44iAXrkVY28HY',
      ),
    ],
  ),
];
