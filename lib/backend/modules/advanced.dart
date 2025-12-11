import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'digital_literacy_advanced_clean',
    title: 'Digital Literacy & Productivity Tools – Advanced',
    description:
        'Advanced module focusing on complex document production, data analysis, presentation design, digital collaboration systems, and information management.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'dl_advanced_ch1',
        title: 'Advanced Document Production, Data Analysis & Digital Collaboration',
        difficultyLevel: 'Advanced',
        summary: '''
This module develops advanced skills in digital literacy, enabling learners to create structured documents, analyze large datasets, design professional presentations, and manage digital workflows.

Topics include:
• Advanced word processing features such as templates, automated tables of contents, mail merge, citations, tracked changes, and section formatting  
• Document production with consistent visual identity, integrated graphics, complex tables, and editorial tools  
• Advanced spreadsheet analysis using pivot tables, VLOOKUP/XLOOKUP, COUNTIF/SUMIF, logic functions, and data visualization  
• Professional presentation design through slide masters, themes, multimedia integration, visual hierarchy, and data-linked charts  
• Digital collaboration using cloud platforms, workflow tools, shared repositories, permissions, real-time editing, and version control  
• Information management strategies such as structured file organization, secure sharing, encryption, and evaluating credible sources  
• Digital security awareness to protect data, maintain privacy, and use digital tools ethically and responsibly  

This module prepares learners for high-level academic, professional, and collaborative digital tasks.
''',
        content:
            'An advanced-level exploration of document automation, spreadsheet data analysis, presentation mastery, digital collaboration platforms, workflow coordination, and secure information management. Learners apply productivity tools strategically to create professional outputs.',
        youtubeUrl: 'https://www.youtube.com/watch?v=vvWn-RL22n0',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1ivguJlPCnpK1FCOvMCaoLKEK7suyiS-L',
      ),
    ],
  ),
];
