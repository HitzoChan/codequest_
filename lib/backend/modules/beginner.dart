import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'css_beginner_clean',
    title: 'Computer Systems Servicing – Beginner',
    description:
        'Beginner module introducing computer components, peripherals, safety procedures, servicing tools, and preventive maintenance.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'css_beginner_ch1',
        title: 'Introduction to Computer Systems Servicing',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the foundational concepts of Computer Systems Servicing (CSS), focusing on how computer hardware and peripherals function and how technicians maintain and repair systems.

Topics include:
• Introduction to computer systems servicing and the role of a technician  
• Major internal components: CPU, RAM, storage devices, motherboard, expansion cards  
• Peripheral devices and their functions such as input, output, and storage peripherals  
• Basic servicing tools including screwdrivers, anti-static wrist straps, and cable testers  
• Essential safety practices like disconnecting power and preventing electrostatic discharge  
• Preventive maintenance: cleaning components, checking cables, updating drivers, and ensuring ventilation  
• Importance of CSS fundamentals for troubleshooting, upgrades, and safe hardware handling  

This module prepares learners to identify components, follow safety procedures, and perform basic servicing tasks confidently.
''',
        content:
            'A beginner-focused explanation of computer components, peripherals, servicing tools, and safety procedures. It covers the technician’s responsibilities, proper tool usage, and the importance of preventive maintenance in keeping computer systems reliable and efficient.',
        youtubeUrl: 'https://www.youtube.com/watch?v=qfUZBKDh9BY',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=147Dh5tlwYp-jKsgVwAA6E9wgrjaI4LqR',
      ),
    ],
  ),
];
