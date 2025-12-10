import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'web_dev_intermediate_clean',
    title: 'Web Development – Intermediate',
    description:
        'Intermediate module covering core web technologies including the client–server model, HTTP/HTTPS, the DOM, responsive design, and website behavior.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'web_dev_intermediate_ch1',
        title: 'Web Foundations and Core Web Technologies',
        difficultyLevel: 'Intermediate',
        summary: '''
This module explores the core foundations of how websites function.

Topics include:
• The Client–Server Model: how browsers send requests and servers deliver responses  
• HTTP and HTTPS: how data is transmitted and how secure communication works  
• The DOM (Document Object Model): how browsers build a page structure and how JavaScript interacts with it  
• Responsive Web Design: flexible layouts, media queries, and adapting to different screen sizes  
• Static vs Dynamic Websites: how content is delivered and updated  

This module builds a solid understanding of how modern websites operate and respond to users.
''',
        content:
            'A detailed exploration of web communication, rendering, responsiveness, and website behavior, including how browsers and servers exchange data, how webpages adapt to devices, and how interactive experiences are created through the DOM and JavaScript.',
        youtubeUrl: 'https://www.youtube.com/watch?v=hJHvdBlSxug',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1bA6DkwreiAtVPrDAXHUdtkmramQJFQND',
      ),
    ],
  ),
];
