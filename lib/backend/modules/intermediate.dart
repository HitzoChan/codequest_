import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'networking_intermediate_clean',
    title: 'Networking 1 – Intermediate',
    description:
        'Intermediate module exploring the OSI and TCP/IP models, IP addressing, subnet masks, network devices, and troubleshooting tools.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'networking_intermediate_ch1',
        title: 'Network Models, Addressing, and Devices',
        difficultyLevel: 'Intermediate',
        summary: '''
This module explains the core models, addressing systems, and devices used in computer networks.

Topics include:
• The OSI Model and its seven layers  
• The TCP/IP Model and its four functional layers  
• IP addressing and the structure of IPv4 addresses  
• Private and public IP ranges  
• The purpose of subnet masks  
• Common networking devices such as switches, routers, access points, and firewalls  
• Basic troubleshooting tools including ping, ipconfig/ifconfig, and traceroute  

The module strengthens understanding of network communication and device interaction.
''',
        content:
            'A detailed exploration of theoretical and practical networking models, fundamentals of IP addressing and subnetting, roles of network devices, and widely used troubleshooting commands that help diagnose network issues.',
        youtubeUrl: 'https://www.youtube.com/watch?v=nomyRJehhnM',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1k7HhbODJtd0MyLCxSvEuzXenVkyPwwPF',
      ),
    ],
  ),
];
