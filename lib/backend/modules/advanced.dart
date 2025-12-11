import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'cloud_computing_advanced_clean',
    title: 'Cloud Computing – Advanced',
    description:
        'Advanced module covering cloud architecture, microservices, containerization, orchestration, serverless computing, advanced cloud security, and multi-cloud strategies.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'cloud_advanced_ch1',
        title: 'Advanced Cloud Architecture, Containerization, and Security',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores the advanced technologies and architectural concepts used to build scalable, resilient, and secure cloud environments.

Topics include:
• Advanced cloud architecture principles such as scalability, resilience, and fault tolerance  
• Microservices architecture and independent service deployment  
• Containerization technologies like Docker and how containers provide consistency across environments  
• Kubernetes orchestration for automated deployment, scaling, and workload management  
• Serverless computing and event-driven execution of cloud functions  
• Zero-trust security, encryption, automated threat detection, and identity controls  
• Multi-cloud and hybrid cloud strategies for flexibility, reliability, and vendor independence  

This module equips learners with the knowledge needed to design and manage modern cloud infrastructures.
''',
        content:
            'A detailed explanation of scalable cloud architectures, microservices, container-based deployment, orchestration systems such as Kubernetes, serverless execution models, advanced security practices, and multi-cloud/hybrid strategies used in enterprise environments.',
        youtubeUrl: 'https://www.youtube.com/watch?v=kBF6Bvth0zw',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=164fyxw-7JwFohWh1wqkiDMPgSCi8-Bm3',
      ),
    ],
  ),
];
