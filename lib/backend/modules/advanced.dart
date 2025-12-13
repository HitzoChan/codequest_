import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'cybersecurity_advanced_clean',
    title: 'Cybersecurity Fundamentals – Advanced',
    description:
        'Advanced module covering advanced cyber threats, cryptography, network defense, ethical hacking, and cybersecurity frameworks.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'cybersecurity_advanced_ch1',
        title: 'Advanced Threats, Cryptography & Cyber Defense',
        difficultyLevel: 'Advanced',
        summary: '''
This module focuses on advanced cybersecurity concepts used to defend against sophisticated attacks and secure modern systems.

Topics include:
• Advanced Persistent Threats (APTs) and zero-day exploits  
• Man-in-the-Middle (MITM) and other advanced attack techniques  
• Cryptographic concepts such as hashing and digital signatures  
• Zero Trust Architecture and modern network defense strategies  
• Security Information and Event Management (SIEM) systems  
• Ethical hacking and penetration testing methodologies  
• Cybersecurity frameworks such as the NIST Cybersecurity Framework  

These topics prepare learners to analyze, detect, and respond to advanced cybersecurity threats.
''',
        content:
            'An advanced-level exploration of modern cyber threats, cryptographic protections, network defense architectures, ethical hacking practices, and cybersecurity frameworks.',
        // 
        youtubeUrl: 'https://www.youtube.com/watch?v=BgEKZEBU8uE',
        // 
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1x45Zgb3ooQss92RfWfYvET88DAgMloFA',
      ),
    ],
  ),
];
