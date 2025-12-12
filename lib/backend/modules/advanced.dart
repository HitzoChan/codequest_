import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'hci_advanced_clean',
    title: 'Human–Computer Interaction – Advanced',
    description:
        'Advanced module covering cognitive models, accessibility standards, multimodal interaction, high-fidelity prototyping, and advanced evaluation techniques.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'hci_advanced_ch1',
        title: 'Cognitive Models, Accessibility, Interaction Paradigms & Advanced Evaluation',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced concepts that influence how users think, behave, and interact with modern digital systems.

Topics include:
• Cognitive models that explain human perception, memory, attention, and motor behavior  
• GOMS, Fitts’ Law, and other analytical tools for predicting user performance  
• Accessibility principles and inclusive design, focusing on diverse user needs  
• WCAG standards for creating accessible web interfaces  
• Emerging interaction paradigms including multimodal interfaces, voice input, gestures, and ubiquitous computing  
• High-fidelity prototyping using realistic visuals and interactions for deep testing  
• Advanced evaluation methods such as cognitive walkthroughs, eye-tracking, controlled experiments, and heuristic analysis  

This module prepares learners to design research-informed, inclusive, and forward-thinking user experiences for complex systems.
''',
        content:
            'A detailed exploration of cognitive modeling, accessibility guidelines, multimodal interaction, high-fidelity prototyping, and rigorous evaluation methods. Learners gain advanced analytical and design skills for building intuitive, inclusive, and high-performance interfaces.',
        youtubeUrl: 'https://www.youtube.com/watch?v=YOAhPg3L9Vg',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1aFkQDMy25ZH62r4zoFUeX-Pm_w9VsEN5',
      ),
    ],
  ),
];
