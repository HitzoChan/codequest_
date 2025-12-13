import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'os_advanced_clean',
    title: 'Operating Systems – Advanced',
    description:
        'Advanced module focusing on concurrency, synchronization, distributed systems, security mechanisms, and kernel architectures.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'os_advanced_ch1',
        title: 'Concurrency, Deadlocks, Distributed Systems, and Kernel Design',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced concepts in modern operating systems.

Topics include:
• Concurrency and parallel execution of processes and threads
• Race conditions and critical section problems
• Synchronization mechanisms such as semaphores and mutexes
• Deadlocks, deadlock conditions, and avoidance techniques
• Banker’s Algorithm for deadlock avoidance
• Distributed operating systems and coordinated resource sharing
• Remote Procedure Call (RPC) for inter-process communication across machines
• Operating system security using access control lists and permissions
• Kernel architectures: monolithic kernel vs microkernel design
• Reliability, scalability, and performance considerations in advanced OS design
''',
        content:
            'An advanced-level discussion of operating system mechanisms that enable concurrent execution, synchronization, deadlock handling, distributed coordination, security enforcement, and kernel architecture design to ensure system reliability and scalability.',
        youtubeUrl: 'https://www.youtube.com/watch?v=rWFH6PLOIEI',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1B9I9K3alp1g4WEhP8HxHgpB2cC7hHk82',
      ),
    ],
  ),
];
