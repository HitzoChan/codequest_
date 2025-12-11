import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'css_intermediate_clean',
    title: 'Computer Systems Servicing – Intermediate',
    description:
        'Intermediate module covering system configuration, BIOS/UEFI, disk partitioning, OS installation, diagnostics, troubleshooting, and system optimization.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'css_intermediate_ch1',
        title: 'System Configuration, BIOS/UEFI, Troubleshooting, and Optimization',
        difficultyLevel: 'Intermediate',
        summary: '''
This module covers intermediate-level concepts in computer systems servicing, focusing on configuring, maintaining, and optimizing computer systems.

Topics include:
• System configuration and why it ensures hardware and software work efficiently  
• BIOS and UEFI functions, setup navigation, and configuring boot options  
• Disk partitioning, file systems, and their role in organizing and managing data  
• Operating system installation and post-installation configuration tasks including drivers and updates  
• Diagnostic tools for identifying hardware and software issues  
• Structured troubleshooting processes to isolate and resolve system problems  
• System optimization such as cleaning temporary files, updating drivers, managing startup programs, and improving hardware performance  

This module builds essential skills needed to install, configure, diagnose, and optimize modern computer systems.
''',
        content:
            'An in-depth explanation of system configuration concepts including firmware settings, disk management, OS installation, diagnostics, troubleshooting workflows, and optimization techniques. The module equips learners with practical skills needed for real-world servicing tasks.',
        youtubeUrl: 'https://www.youtube.com/watch?v=aGhCUJmtDR4',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1V0E6O5K1Xm07tGuWIuh0fise_9TE5-BW',
      ),
    ],
  ),
];
