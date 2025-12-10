import 'models.dart';

class AdvancedIntroComputingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Computer architecture at the advanced level focuses on:',
      choices: [
        'The design of computer packaging',
        'How system components interact to optimize performance',
        'Only the appearance of the user interface',
        'Reducing all hardware to a single chip',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The instruction set architecture (ISA) is important because it:',
      choices: [
        'Determines the color of the monitor',
        'Defines how software communicates with hardware',
        'Removes the need for an operating system',
        'Stores user accounts and passwords',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Multicore processors improve performance by:',
      choices: [
        'Running only one task at a time',
        'Allowing multiple processing tasks to execute simultaneously',
        'Replacing memory hierarchy',
        'Disabling multitasking',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'CPU pipelining increases performance by:',
      choices: [
        'Slowing down instruction execution',
        'Executing instructions one at a time',
        'Dividing instructions into stages processed simultaneously',
        'Removing the need for cache memory',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Cache memory is used because it:',
      choices: [
        'Stores data permanently',
        'Provides fast access to frequently used data',
        'Replaces all RAM',
        'Slows down processing',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Virtual memory helps improve system performance by:',
      choices: [
        'Turning off physical memory',
        'Using storage devices to extend available memory',
        'Eliminating the need for multitasking',
        'Preventing access to the CPU',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Parallel computing refers to:',
      choices: [
        'Completing tasks using a single processor',
        'Executing multiple parts of a task at the same time',
        'Moving data physically between buildings',
        'Running applications one after another',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Distributed computing involves:',
      choices: [
        'One computer doing all the work',
        'Multiple computers working together across a network',
        'A single server storing all data offline',
        'Blocking communication between systems',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Edge computing improves efficiency by:',
      choices: [
        'Moving data processing closer to where the data is generated',
        'Sending all data to one central server',
        'Slowing down communication networks',
        'Eliminating the need for cloud computing',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Quantum computing is distinct because it:',
      choices: [
        'Uses binary 0s and 1s only',
        'Depends entirely on classical logic gates',
        'Uses quantum states to perform complex computations',
        'Cannot solve mathematical problems',
      ],
      correctIndex: 2,
    ),

  ];
}
