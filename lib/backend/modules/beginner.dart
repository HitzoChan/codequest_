import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'networking_101_beginner',
    title: 'Networking 1 – Introduction to Computer Networks',
    description:
        'Beginner module based on the uploaded PDF, covering the basics of computer networks, components, types, and data transmission.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'networking_ch1_intro',
        title: 'Introduction to Computer Networks',
        summary: '''
This module introduces the fundamentals of computer networking based on the uploaded PDF.

Topics include:
• What computer networking is and why it is important
• Basic components of a network (devices, hardware, media)
• Importance and advantages of networks in daily life
• Types of networks (LAN, MAN, WAN)
• Network topologies (Bus, Star, Ring, Mesh)
• Basic data transmission concepts (simplex, half-duplex, full-duplex)

This module provides a foundation for understanding how devices communicate and share information in modern digital environments.
''',
        content:
            'A beginner-friendly overview of computer networks, components, classifications, topologies, and how data travels across devices.',
        youtubeUrl: 'https://www.youtube.com/watch?v=3QhU9jd03a0', // Working Networking Fundamentals video
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1s4Sqmn9y2wgKrk_zecAYVSgJ3UhjDJHY',
      ),
    ],
  ),
];
