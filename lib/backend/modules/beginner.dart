import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'networking_beginner_clean',
    title: 'Networking 1 – Beginner',
    description:
        'Beginner module introducing the fundamentals of computer networking, devices, transmission, and network types.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'networking_beginner_ch1',
        title: 'Introduction to Computer Networks',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the foundational concepts of computer networks.

Topics include:
• What computer networking is and how devices share resources  
• Key network components such as devices, hardware, and transmission media  
• The importance of networks in communication and collaboration  
• Types of networks including LAN, MAN, and WAN  
• Common network topologies such as bus, star, ring, and mesh  
• Basic data transmission concepts and communication modes  
''',
        content:
            'A beginner-friendly explanation of how networks enable devices to communicate, the components that make up a network, classifications of network sizes, common topologies, and how data moves between devices.',
        youtubeUrl: 'https://www.youtube.com/watch?v=3QhU9jd03a0',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1bA6DkwreiAtVPrDAXHUdtkmramQJFQND',
      ),
    ],
  ),
];
