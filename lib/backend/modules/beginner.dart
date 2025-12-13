import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'cybersecurity_beginner_clean',
    title: 'Cybersecurity Fundamentals – Beginner',
    description:
        'Beginner module introducing cybersecurity concepts, threats, vulnerabilities, and basic protection measures.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'cybersecurity_beginner_ch1',
        title: 'Introduction to Cybersecurity and Basic Protection',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the basic concepts of cybersecurity and why protecting digital systems is important.

Topics include:
• Definition of cybersecurity and its importance  
• The CIA triad: Confidentiality, Integrity, and Availability  
• Common cybersecurity threats such as malware and phishing  
• Vulnerabilities and how attackers exploit weaknesses  
• Basic cybersecurity practices like software updates and strong passwords  
• Authentication and access control concepts  
• Importance of cybersecurity awareness for users  

These topics provide a strong foundation for understanding how to stay safe in digital environments.
''',
        content:
            'A beginner-level overview of cybersecurity covering core principles, common threats, vulnerabilities, access control, and basic protection practices.',
        
        youtubeUrl: 'https://youtu.be/awhqnSskWjU?si=1mithuo5hV7gzm2D',
        
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1bp0u-MmFDn7k8UXTWlJamOZ1vaMVhjc2',
      ),
    ],
  ),
];
