import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'cloud_computing_beginner_clean',
    title: 'Cloud Computing – Beginner',
    description:
        'Beginner module introducing the fundamentals of cloud computing, characteristics, deployment models, service models, advantages, and common uses.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'cloud_computing_beginner_ch1',
        title: 'Introduction to Cloud Computing',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the essential concepts of cloud computing and how modern organizations use cloud-based technologies.

Topics include:
• What cloud computing is and how resources are delivered over the internet  
• Key characteristics such as on-demand self-service, scalability, resource pooling, and measured service  
• Cloud deployment models including public, private, and hybrid cloud  
• Primary cloud service models: IaaS, PaaS, and SaaS  
• Advantages such as cost efficiency, flexibility, collaboration, and enhanced security  
• Common uses across business, education, media, and everyday digital services  

This module provides a solid foundation for understanding how cloud services support modern computing environments.
''',
        content:
            'A clear explanation of cloud computing concepts, essential characteristics, deployment models, service layers, benefits, and real-world applications used across different industries and daily digital activities.',
        youtubeUrl: 'https://www.youtube.com/watch?v=M988_fsOSWo',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1_daLCrTUxlorfvgKsQP3Ivg6h10P8YVB',
      ),
    ],
  ),
];
