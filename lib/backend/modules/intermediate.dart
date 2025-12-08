import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'web_dev_intermediate_pdf',
    title: 'Web Development – Intermediate',
    description:
        'Intermediate-level module based on the uploaded PDF covering client–server communication, HTTP/HTTPS, DOM, responsive design, and website types.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'web_dev_intermediate_ch1',
        title: 'Web Foundations & Core Web Technologies',
        summary: '''
This module covers the core intermediate topics of web development based entirely on the uploaded Intermediate PDF.

Topics include:
• The Client–Server Model (browser requests, server responses, URLs)
• HTTP & HTTPS protocols (data transfer, security, encryption)
• The Document Object Model (DOM structure, nodes, browser rendering)
• JavaScript–DOM interaction (dynamic updates, interactivity)
• Responsive Web Design (flexible layouts, media queries, mobile-first)
• Static vs Dynamic Websites (content generation, server-side processing)

This module helps learners deepen their understanding of how the web works internally and how modern websites adapt to different devices.
''',
        content:
            'An intermediate-level overview of client–server communication, HTTP vs HTTPS, DOM structure, JavaScript interactivity, responsive design principles, and the differences between static and dynamic websites.',
        difficultyLevel: 'Intermediate',
        youtubeUrl: 'https://youtu.be/pQN-pnXPaVg?si=W9d0OimgrXta5V58',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1bA6DkwreiAtVPrDAXHUdtkmramQJFQND',
      ),
    ],
  ),
];
