import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'cybersecurity_intermediate_clean',
    title: 'Cybersecurity Fundamentals – Intermediate',
    description:
        'Intermediate module covering network security, encryption, threat actors, security policies, and incident response.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'cybersecurity_intermediate_ch1',
        title: 'Network Security, Encryption & Incident Response',
        difficultyLevel: 'Intermediate',
        summary: '''
This module expands cybersecurity knowledge by focusing on how organizations protect networks and respond to security incidents.

Topics include:
• Network security fundamentals and the role of firewalls  
• Intrusion Detection Systems (IDS) for monitoring suspicious activity  
• Encryption basics including symmetric and asymmetric encryption  
• Threat actors such as cybercriminals and insider threats  
• Security policies and organizational controls  
• Incident response phases including preparation, detection, containment, and recovery  
• Importance of post-incident analysis  

These topics help learners understand how layered security defenses protect systems and data.
''',
        content:
            'An intermediate-level study of network security, encryption methods, threat actors, security policies, and structured incident response processes.',
        // 
        youtubeUrl: 'https://youtu.be/rz0RL4Xue-A?si=O_wTT5IoV4pI9cKq',
        // 
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=11U34EsrOFuHRM2j7eQGY9HJgj0ZWCHfg',
      ),
    ],
  ),
];
