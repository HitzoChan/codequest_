import 'models.dart';

class AdvancedOSQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'Concurrency in an operating system refers to:',
      choices: [
        'Running only one process at a time',
        'Multiple processes or threads executing simultaneously',
        'Shutting down unused programs',
        'Storing files on multiple disks',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A race condition occurs when:',
      choices: [
        'Two users log in at the same time',
        'Processes access shared data without proper synchronization',
        'The CPU overheats',
        'Memory allocation fails',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A semaphore or mutex is used to:',
      choices: [
        'Speed up file transfers',
        'Manage exclusive access to shared resources',
        'Replace virtual memory',
        'Detect viruses',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A deadlock occurs when:',
      choices: [
        'The system reboots unexpectedly',
        'Processes wait indefinitely for resources held by each other',
        'A file cannot be found',
        'A user opens too many windows',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question:
          'Which method aims to avoid deadlocks by checking resource requests before granting them?',
      choices: [
        'Monolithic scheduling',
        'Banker\'s Algorithm',
        'FIFO replacement',
        'Paging',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A distributed operating system is designed to:',
      choices: [
        'Run on a single machine only',
        'Make multiple computers function as one coordinated system',
        'Replace all hardware drivers',
        'Block network access',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Remote Procedure Call (RPC) allows:',
      choices: [
        'A program to execute a procedure on another machine as if it were local',
        'Only one process to run at a time',
        'Disk errors to be automatically corrected',
        'Files to delete themselves',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question:
          'OS security mechanisms such as ACLs and permissions are used to:',
      choices: [
        'Increase file size',
        'Control access to system resources',
        'Speed up CPU cycles',
        'Disable background processes',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A monolithic kernel is characterized by:',
      choices: [
        'Keeping most OS services in user space',
        'Having all major OS components in one large program',
        'Requiring no device drivers',
        'Being slower than all other designs',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A microkernel improves system reliability by:',
      choices: [
        'Combining all services directly inside the kernel',
        'Limiting the kernel to essential functions and moving other services to user space',
        'Removing hardware support modules',
        'Increasing virtual memory automatically',
      ],
      correctIndex: 1,
    ),
  ];
}
