import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'hci_beginner_clean',
    title: 'Human–Computer Interaction – Beginner',
    description:
        'Beginner module introducing Human–Computer Interaction (HCI), usability, user experience, basic interaction principles, human factors, and prototyping.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'hci_beginner_ch1',
        title: 'Introduction to HCI, Usability, UX, and Interaction Principles',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces learners to the foundations of Human–Computer Interaction (HCI), focusing on how users interact with technology and how systems can be designed to improve that experience.

Topics include:
• Understanding Human–Computer Interaction and its importance in designing user-centered systems  
• Usability concepts such as simplicity, clarity, efficiency, consistency, and effective feedback  
• User Experience (UX) principles involving user perception, emotions, satisfaction, and interaction flow  
• Basic interaction principles including visibility, affordances, consistency, and feedback  
• Human factors such as user differences, abilities, ergonomics, accessibility, and cognitive limitations  
• The role of prototyping using sketches, wireframes, and early testing to refine interface designs  
• Importance of studying HCI to create intuitive, inclusive, and efficient digital systems  

This module helps learners develop awareness of how to evaluate interfaces, understand user needs, and contribute to user-centered design.
''',
        content:
            'An introductory exploration of HCI, usability, user experience, interaction principles, human factors, and prototyping. Learners build foundational skills for analyzing interfaces and designing systems that effectively support user goals.',
        youtubeUrl: 'https://www.youtube.com/watch?v=m3EzxNfpsr0',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1MIqXm8UDbDWshfMPtCZGCthpcQjQ5cLQ',
      ),
    ],
  ),
];
