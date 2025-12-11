import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'digital_literacy_intermediate_clean',
    title: 'Digital Literacy & Productivity Tools – Intermediate',
    description:
        'Intermediate module focusing on structured document creation, data analysis in spreadsheets, presentation design, cloud collaboration tools, and professional digital communication.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'dl_intermediate_ch1',
        title: 'Intermediate Document Design, Data Organization & Digital Collaboration',
        difficultyLevel: 'Intermediate',
        summary: '''
This module builds on foundational digital literacy by introducing more advanced tools and techniques for creating professional documents, analyzing data, designing effective presentations, and collaborating online.

Topics include:
• Intermediate word processing skills such as styles, headers/footers, tables, hyperlinks, and track changes  
• Creating well-structured documents with consistent formatting and visual organization  
• Spreadsheet skills including formulas (SUM, AVERAGE, IF), sorting, filtering, charts, and conditional formatting  
• Understanding absolute and relative references and organizing data into tables  
• Presentation enhancement using layout principles, color harmony, visual hierarchy, and proper use of multimedia  
• Cloud-based collaboration including shared editing, permissions, version history, and remote teamwork  
• Professional communication etiquette, clarity in messaging, and evaluating credible online information  

This module strengthens digital productivity skills needed for academic, workplace, and collaborative environments.
''',
        content:
            'A detailed explanation of document structuring, data analysis techniques, presentation design principles, cloud collaboration features, and digital communication etiquette. Learners enhance productivity and professionalism using intermediate digital tools.',
        youtubeUrl: 'https://www.youtube.com/watch?v=MJHhTTh-q3g',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1Vb9Fif6kNY7y6KrzAZs-l7mOzXbLqzRx',
      ),
    ],
  ),
];
