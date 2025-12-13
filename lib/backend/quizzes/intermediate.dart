import 'models.dart';

class IntermediateOSQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'A process is best defined as:',
      choices: [
        'A file stored on disk',
        'A program in execution',
        'A hardware component',
        'A user account',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The Process Control Block (PCB) is used to:',
      choices: [
        'Store images and documents',
        'Track process information such as ID, registers, and memory allocation',
        'Represent the file system hierarchy',
        'Display GUI windows',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which scheduling algorithm executes processes in order of arrival?',
      choices: [
        'Round Robin (RR)',
        'Shortest Job First (SJF)',
        'First-Come, First-Served (FCFS)',
        'Priority Scheduling',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Round Robin scheduling is known for:',
      choices: [
        'Giving each process a fixed time slice',
        'Always choosing the longest job first',
        'Running only one process at a time',
        'Ignoring waiting processes',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Paging divides memory into:',
      choices: [
        'Random-sized chunks',
        'Fixed-size blocks called pages',
        'Variable-sized files',
        'User-created partitions',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Virtual memory allows a system to:',
      choices: [
        'Run without RAM',
        'Use disk space to extend available memory',
        'Delete inactive processes automatically',
        'Bypass the CPU scheduler',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A page replacement algorithm determines:',
      choices: [
        'Which users can access a file',
        'Which memory pages should be removed from RAM',
        'How process IDs are assigned',
        'How directories are named',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A file system is responsible for:',
      choices: [
        'Managing the CPU pipeline',
        'Organizing and storing data on disks',
        'Rendering GUI components',
        'Scheduling device interrupts',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Device drivers are used to:',
      choices: [
        'Translate OS commands into signals hardware can understand',
        'Encrypt user data',
        'Allocate RAM to processes',
        'Display icons on the desktop',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Interrupt handling allows the OS to:',
      choices: [
        'Run only one device at a time',
        'Respond to hardware events quickly and temporarily pause the CPU',
        'Delete background processes',
        'Disable user access to files',
      ],
      correctIndex: 1,
    ),
  ];
}
