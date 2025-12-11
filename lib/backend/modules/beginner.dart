import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'digital_literacy_beginner_clean',
    title: 'Digital Literacy & Productivity Tools – Beginner',
    description:
        'Beginner module introducing digital literacy, ICT concepts, and basic productivity tools such as word processors, spreadsheets, and presentations.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'dl_beginner_ch1',
        title: 'Introduction to Digital Literacy & Productivity Tools',
        difficultyLevel: 'Beginner',
        summary: '''
This module introduces the essential skills needed to navigate digital environments, use ICT tools, and apply basic productivity applications.

Topics include:
• Understanding digital literacy and its importance in communication, learning, and productivity  
• Basic ICT concepts including hardware, software, networks, the internet, and cloud services  
• Introduction to productivity tools such as word processors, spreadsheets, and presentation software  
• Word processing basics including text editing, formatting, layout, and inserting elements  
• Spreadsheet basics such as rows, columns, cells, formulas, and simple data organization  
• Presentation software basics including slide layout, visual themes, images, and simple animations  
• How digital literacy enhances academic tasks, workplace readiness, and everyday digital communication  

This module builds strong foundational skills needed to use digital tools confidently and effectively.
''',
        content:
            'An introductory explanation of digital literacy, ICT systems, and key productivity tools. Learners explore essential features of word processors, spreadsheets, and presentation software to support communication, organization, and digital tasks.',
        youtubeUrl: 'https://www.youtube.com/watch?v=_LElWqXi7Ag',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1ylS5Tg_Sf-17A5yj0guShvVbuctNgtmO',
      ),
    ],
  ),
];
