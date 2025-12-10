import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'networking_advanced_clean',
    title: 'Networking 1 – Advanced',
    description:
        'Advanced module covering enterprise architectures, routing concepts, routing protocols, VLANs, security mechanisms, and WAN technologies.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'networking_advanced_ch1',
        title: 'Advanced Network Architectures, Routing, and Security',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced networking concepts used in large-scale and enterprise environments.

Topics include:
• Enterprise network layers: core, distribution, and access  
• Routing fundamentals and routing tables  
• Static and dynamic routing  
• Routing protocols such as RIP, OSPF, and BGP  
• VLAN segmentation for improved security and efficiency  
• Advanced security tools including ACLs, IDS, IPS, and VPNs  
• WAN technologies such as MPLS, fiber optics, satellite, and broadband  

This module strengthens understanding of how large networks operate and how data flows securely across complex infrastructures.
''',
        content:
            'A detailed discussion of hierarchical network architecture, routing operations, protocol behavior, logical segmentation using VLANs, advanced security enforcement with ACLs and intrusion systems, and major WAN technologies supporting long-distance communication.',
        youtubeUrl: 'https://www.youtube.com/watch?v=pAopv0-lKxY',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1v9wCr2SpEH8lrXxYv_c9JjmxJ5HLSuFP',
      ),
    ],
  ),
];
