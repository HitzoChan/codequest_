import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'integrative_programming_intermediate_clean',
    title: 'Integrative Programming – Intermediate',
    description:
        'Intermediate module covering programming integration techniques, scripting, data exchange mechanisms, middleware, web services, and system error handling.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'ip_intermediate_ch1',
        title: 'Integration Techniques, Data Exchange, and Middleware',
        difficultyLevel: 'Intermediate',
        summary: '''
This module introduces essential techniques and tools for integrating applications and enabling systems to work together smoothly.

Topics include:
• Programming integration techniques for connecting multiple languages, components, and technologies  
• Scripting and automation using languages like Python, JavaScript, and Bash  
• Data exchange mechanisms including RESTful APIs, JSON, XML, and asynchronous messaging  
• Middleware such as messaging queues, application servers, and API gateways  
• Web services including SOAP and REST and when to use each  
• Integration challenges, versioning issues, and effective error handling practices  
• The importance of integration in modern systems such as cloud services, enterprise applications, and distributed environments  

This module prepares learners to build scalable, interoperable, and real-world applications.
''',
        content:
            'A detailed discussion of scripting, automation, REST communication, structured data formats, middleware tools, and the fundamentals of SOAP and REST web services. It also covers common integration challenges and the role of error handling in maintaining stable system interactions.',
        youtubeUrl: 'https://www.youtube.com/watch?v=tQwStJ9fDPQ',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1hk8jR2s8RDFq4ZJGXT5Ib2sJrxlqHjFj',
      ),
    ],
  ),
];
