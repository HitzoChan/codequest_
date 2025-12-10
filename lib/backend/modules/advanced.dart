import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'networking_103_advanced',
    title: 'Networking 1 – Advanced Concepts',
    description:
        'Advanced module covering enterprise architectures, routing concepts, routing protocols, VLANs, ACLs, VPNs, and WAN technologies.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'networking_advanced_ch1',
        title: 'Advanced Network Architectures, Routing & Protocols',
        difficultyLevel: 'Advanced',
        summary: '''
This advanced module explores how large-scale networks operate, how traffic flows across enterprise environments, and how routing protocols manage communication between networks.

Topics include:
• Enterprise Architecture: Core, Distribution, and Access Layers
• Routing Concepts: Routing tables, static vs dynamic routing
• Routing Protocols: RIP, OSPF, BGP and their metrics
• VLANs: Logical segmentation for security and efficiency
• Advanced Network Security: ACLs, IDS/IPS, VPNs
• WAN Technologies: MPLS, Fiber Optic, Satellite, Broadband

This module prepares learners for real-world enterprise networking and large-scale infrastructures.
''',
        content:
            'A complete overview of enterprise network structures, routing decisions, routing protocols, VLAN segmentation, core security mechanisms such as ACLs and VPNs, and major WAN technologies used for long-distance communication.',
        youtubeUrl: 'https://www.youtube.com/watch?v=pAopv0-lKxY',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1v9wCr2SpEH8lrXxYv_c9JjmxJ5HLSuFP',
      ),
    ],
  ),
];
