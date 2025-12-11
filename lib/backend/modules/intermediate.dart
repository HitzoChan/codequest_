import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'cloud_computing_intermediate_clean',
    title: 'Cloud Computing – Intermediate',
    description:
        'Intermediate module covering virtualization, cloud storage systems, cloud networking, cloud security, compliance, and data protection.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'cloud_intermediate_ch1',
        title: 'Virtualization, Cloud Storage, Networking, and Security',
        difficultyLevel: 'Intermediate',
        summary: '''
This module explains the technologies and practices that enable cloud computing environments.

Topics include:
• Virtualization concepts and how virtual machines operate  
• Types of virtualization such as server, storage, and network virtualization  
• Cloud storage systems including object, file, and block storage  
• Cloud networking, virtual networks, and remote management tools  
• Cloud security fundamentals including encryption, shared responsibility, and monitoring  
• Compliance, data protection, and regulatory standards in cloud environments  

The module builds a deeper understanding of how cloud systems operate and remain secure and scalable.
''',
        content:
            'A detailed discussion of virtualization technologies, cloud storage methods, cloud networking tools, and essential cloud security practices. It also covers compliance requirements, data protection, and the role of virtualization in building flexible, cost-efficient cloud infrastructures.',
        youtubeUrl: 'https://www.youtube.com/watch?v=Qt9lhzFhW_c',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1pzcUCfTp1N94T8sqj_qqkjqFgiojCzPW',
      ),
    ],
  ),
];
