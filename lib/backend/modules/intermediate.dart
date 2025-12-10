import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'intro_computing_intermediate_clean',
    title: 'Introduction to Computing – Intermediate',
    description:
        'Intermediate module explaining how computer systems operate, the role of operating systems, software management, file organization, and system security.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'intro_computing_intermediate_ch1',
        title: 'Computer Systems, Operating Systems, and Software Management',
        difficultyLevel: 'Intermediate',
        summary: '''
This module discusses how computer systems function and how operating systems manage hardware, software, and user interactions.

Topics include:
• Components of a computer system and how they interact  
• The operating system as the bridge between hardware, software, and users  
• Types of operating systems including desktop, mobile, server, and embedded  
• Software installation, configuration, updates, and resource allocation  
• File management, storage concepts, and how data is organized for efficient access  
• User accounts, permissions, and system security practices  

This module helps learners understand how computing environments operate, how applications are managed, and how system resources remain secure and efficient.
''',
        content:
            'An in-depth explanation of computer system components, operating system functions, software installation and updates, file organization methods, and the role of user accounts and security tools in protecting system resources.',
        youtubeUrl: 'https://www.youtube.com/watch?v=26QPDBe-NB8',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1KEfiB4hwqPkXiyYxQyNxs_rSVKE2QdDW',
      ),
    ],
  ),
];
