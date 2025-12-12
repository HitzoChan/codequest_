import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'hci_intermediate_clean',
    title: 'Human–Computer Interaction – Intermediate',
    description:
        'Intermediate module covering the interaction design process, user research methods, information architecture, wireframing, prototyping, and usability evaluation.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'hci_intermediate_ch1',
        title: 'Interaction Design, User Research, IA & Usability Evaluation',
        difficultyLevel: 'Intermediate',
        summary: '''
This module explores structured methods for designing interactive systems, focusing on research, design, and evaluation techniques used in user-centered development.

Topics include:
• The interaction design process including requirement gathering, ideation, prototyping, and evaluation  
• User research methods such as interviews, surveys, observations, and contextual inquiries  
• Information architecture for organizing and structuring content to support navigation and reduce cognitive load  
• Wireframes and low-fidelity prototypes for exploring layout ideas and testing early concepts  
• Usability testing approaches including task-based testing, heuristic evaluation, and think-aloud protocols  
• How evaluation results guide design refinement and improve user effectiveness and satisfaction  

This module strengthens analytical thinking and prepares learners to design interfaces based on real user needs rather than assumptions.
''',
        content:
            'A detailed explanation of the interaction design cycle, user research, information architecture, wireframes, prototypes, and usability evaluation. Learners develop the ability to gather user insights, structure information effectively, and evaluate interfaces using established HCI methods.',
        youtubeUrl: 'https://www.youtube.com/watch?v=0iNojP9tf1U',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1HmiW1vWn8Zfiv3uo9GhvqzFgpAcDHEEd',
      ),
    ],
  ),
];
