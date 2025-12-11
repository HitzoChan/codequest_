import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'css_advanced_clean',
    title: 'Computer Systems Servicing – Advanced',
    description:
        'Advanced module covering hardware diagnostics, system upgrades, network troubleshooting, system security, and preventive maintenance planning.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'css_advanced_ch1',
        title: 'Advanced Hardware Diagnostics, Networking, Security, and Maintenance',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced skills needed for professional computer technicians, focusing on diagnostics, compatibility checks, network troubleshooting, and system protection.

Topics include:
• Advanced hardware diagnostics using tools such as multimeters, thermal scanners, and POST card analyzers  
• Identifying failures in motherboards, RAM, GPUs, PSUs, and storage devices  
• System upgrading and compatibility evaluation, including CPU sockets, RAM types, chipsets, and firmware configuration  
• Network configuration and troubleshooting using IP settings, DNS, routers, switches, and diagnostic commands  
• Implementing system security through antivirus tools, firewalls, BIOS/UEFI protection, and encryption  
• Preventive maintenance planning, documentation, routine inspections, and tracking recurring issues  
• Importance of advanced CSS competencies in IT support, technical servicing, and real-world troubleshooting  

This module prepares learners for higher-level servicing work, technical certifications, and professional IT roles.
''',
        content:
            'A complete explanation of advanced diagnostics, system upgrade procedures, network troubleshooting, system security implementation, and preventive maintenance planning. The module strengthens analytical and technical competencies required for professional computer servicing.',
        youtubeUrl: 'https://www.youtube.com/watch?v=lut1FvW7zU0',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=181vj_r-zzAAZNvqq0tv2Arc5eVp9OaCp',
      ),
    ],
  ),
];
