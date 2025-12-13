import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'operating_systems_intermediate',
    title: 'Operating Systems – Intermediate',
    description:
        'Intermediate module focusing on how operating systems manage processes, memory, files, and hardware devices.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'os_intermediate_ch1',
        title: 'Process, Memory, and Device Management',
        difficultyLevel: 'Intermediate',
        summary: '''
This module explains how operating systems manage multiple tasks and system resources.

Topics include:
• Definition of a process and program execution
• Process Control Block (PCB) and process states
• CPU scheduling algorithms (FCFS, SJF, Round Robin)
• Memory management concepts such as paging and virtual memory
• Page replacement algorithms
• File system organization and storage management
• Device drivers and interrupt handling
• Importance of efficient resource management in modern operating systems
''',
        content:
            'This module provides a deeper understanding of operating system internals, including how processes are scheduled, how memory is allocated and extended using virtual memory, how files are organized on storage devices, and how hardware devices communicate with the operating system using drivers and interrupts.',
        youtubeUrl: 'https://youtu.be/RozoeWzT7IM',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=12ZkbjH5-UYHEJ0-rjIaqXf6EzEV3YmsE',
      ),
    ],
  ),
];
