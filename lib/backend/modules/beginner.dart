import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'os_beginner_clean',
    title: 'Operating Systems – Beginner',
    description:
        'Beginner module introducing the fundamentals of operating systems, their functions, and basic components.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'os_beginner_ch1',
        title: 'Introduction to Operating Systems',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the basic concepts of operating systems and their role in computer systems.

Topics include:
• Definition and purpose of an operating system
• Core functions such as process scheduling and CPU management
• Memory management and allocation of system resources
• File management for organizing and protecting data
• Single-user and multi-user operating systems
• User interfaces: Graphical User Interface (GUI) and Command Line Interface (CLI)
• System calls and how applications interact with hardware safely
• The kernel and its role in managing core system operations
• Why operating systems are essential for modern computing
''',
        content:
            'A beginner-friendly overview of how operating systems manage hardware resources, support applications, provide user interfaces, and ensure efficient and secure computing.',
        youtubeUrl: 'https://www.youtube.com/watch?v=26QPDBe-NB8',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1jj1p7E1l7j9q5GmnTBuUQC7ZOxzoxJIA',
      ),
    ],
  ),
];
