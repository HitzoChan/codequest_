import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'networking_102_intermediate',
    title: 'Networking 1 – Intermediate Concepts',
    description:
        'Intermediate module based on the uploaded PDF, covering OSI & TCP/IP models, IP addressing, subnet masks, network devices, and troubleshooting basics.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'networking_intermediate_ch1',
        title: 'Network Models, IP Addressing, and Network Devices',
        difficultyLevel: 'Intermediate',
        summary: '''
This module provides an intermediate-level understanding of networking concepts based on the uploaded PDF.

Topics include:
• The OSI Model: 7-layer conceptual framework for communication
• The TCP/IP Model: 4-layer practical networking model used in real systems
• Fundamentals of IP Addressing (IPv4, public/private ranges, network/host portions)
• Subnet Masks and their role in dividing networks
• Intermediate Networking Devices (switches, routers, access points, firewalls)
• Basic Troubleshooting Tools (Ping, Ipconfig/Ifconfig, Traceroute, physical checks)

This module helps learners bridge theoretical networking concepts with practical implementation.
''',
        content:
            'An intermediate guide to network communication models, addressing schemes, subnetting basics, essential networking devices, and troubleshooting tools used in diagnosing network issues.',
        youtubeUrl: 'https://www.youtube.com/watch?v=nomyRJehhnM',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1k7HhbODJtd0MyLCxSvEuzXenVkyPwwPF',
      ),
    ],
  ),
];
