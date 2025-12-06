import 'models.dart';

class ComputingIntroBeginnerQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'What is a computer?',
      choices: [
        'A machine that stores, processes, and outputs information',
        'A device used only for gaming',
        'A machine that creates electricity',
        'A tool used only for entertainment'
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Which of the following is an example of computer hardware?',
      choices: [
        'Operating System',
        'Web Browser',
        'Keyboard',
        'Word Processor'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'What does RAM do?',
      choices: [
        'Stores data permanently',
        'Processes instructions',
        'Temporarily stores data for quick access',
        'Connects the computer to the internet'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which part of the computer is known as the "brain"?',
      choices: [
        'Monitor',
        'CPU',
        'Mouse',
        'Speakers'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What is software?',
      choices: [
        'Physical parts of a computer',
        'Electronic signals inside the CPU',
        'Programs or applications you use on a computer',
        'Only video games'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which device shows pictures, videos, and text?',
      choices: [
        'Keyboard',
        'CPU',
        'Monitor',
        'Mouse'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'What is an Operating System (OS)?',
      choices: [
        'A device used to type letters',
        'A program that controls how the computer works',
        'A type of computer virus',
        'A storage device for pictures'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following is an input device?',
      choices: [
        'Printer',
        'Monitor',
        'Mouse',
        'Speakers'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'What type of storage keeps data even when the computer is turned off?',
      choices: [
        'RAM',
        'Temporary Memory',
        'Hard Drive / SSD',
        'Cache'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'What do we call information that a computer processes?',
      choices: [
        'Data',
        'Hardware',
        'Software',
        'Wires'
      ],
      correctIndex: 0,
    ),
  ];
}

class ProgrammingFundamentalsBeginnerQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'What is programming?',
      choices: [
        'Giving instructions to a computer so it can perform tasks',
        'Drawing images on a computer',
        'Connecting computers to the internet',
        'Fixing broken computer hardware'
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Which of the following is a programming language?',
      choices: [
        'Java',
        'Photoshop',
        'Google Chrome',
        'Windows'
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'What does a variable represent in programming?',
      choices: [
        'A permanent file on the computer',
        'A way to store changing values or data',
        'A type of hardware device',
        'A network connection'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which number system do computers primarily use?',
      choices: [
        'Decimal (base 10)',
        'Roman Numerals',
        'Binary (base 2)',
        'Hexadecimal only'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'What is an algorithm?',
      choices: [
        'A computer virus',
        'A step-by-step set of instructions to solve a problem',
        'A hardware component',
        'A type of operating system'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following is an example of an input device?',
      choices: [
        'Printer',
        'Keyboard',
        'Monitor',
        'Speaker'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What is the purpose of a loop in programming?',
      choices: [
        'To repeat a block of code multiple times',
        'To delete data from memory',
        'To display graphics',
        'To connect two devices'
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'What does "boolean" represent in programming?',
      choices: [
        'A number with decimals',
        'A text value',
        'True or False values',
        'A large block of memory'
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Which of the following is an example of output?',
      choices: [
        'Typing on a keyboard',
        'A monitor displaying text or images',
        'A user clicking a mouse',
        'Placing a USB drive into a port'
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'What does a method (or function) do?',
      choices: [
        'Stores data permanently',
        'Groups code so it can be reused or executed when called',
        'Prints documents from the computer',
        'Moves files between folders'
      ],
      correctIndex: 1,
    ),
  ];
}

class SqlIntroQuiz {
  static List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'What does SQL stand for?',
      choices: ['Simple Query Language', 'Structured Query Language', 'System Query List', 'Single Query Logic'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'SQL is mainly used for:',
      choices: ['Designing UI', 'Storing and managing data', 'Building mobile apps', 'Drawing graphics'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Which SQL keyword retrieves data?',
      choices: ['INSERT', 'UPDATE', 'SELECT', 'DELETE'],
      correctIndex: 2,
    ),
    QuizQuestion(
      question: 'Which SQL statement adds new data?',
      choices: ['ADD', 'INSERT', 'PUT', 'APPEND'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'What does the WHERE clause do?',
      choices: ['Sorts data', 'Filters data', 'Deletes all data', 'Groups data'],
      correctIndex: 1,
    ),
  ];
}
