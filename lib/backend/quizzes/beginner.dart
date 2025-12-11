import 'models.dart';

class BeginnerProgrammingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Computer programming is best described as:',
      choices: [
        'Telling a computer what to do through written instructions',
        'Designing hardware components',
        'Creating only mobile applications',
        'Running programs without writing code',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'A programming language’s syntax refers to:',
      choices: [
        'The speed at which a program runs',
        'The rules and structure for writing valid code',
        'The physical components of a computer',
        'The amount of memory used by a program',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'High-level programming languages are:',
      choices: [
        'Difficult for humans to read',
        'Closer to machine code',
        'Easier to understand and write than low-level languages',
        'Used only for hardware control',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A variable in programming is used to:',
      choices: [
        'Store data that may change during program execution',
        'Design the appearance of a web page',
        'Control the speed of the computer',
        'Modify the hardware of the system',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Data types are important because they:',
      choices: [
        'Determine the physical storage device to use',
        'Indicate what kind of data a variable can hold',
        'Remove the need for variables',
        'Automatically fix syntax errors',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Conditional statements in programming allow the program to:',
      choices: [
        'Repeat tasks automatically',
        'Make decisions based on specific conditions',
        'Display only text output',
        'Ignore user input',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A loop is used when:',
      choices: [
        'A program must stop after one instruction',
        'A task needs to be repeated multiple times',
        'Only one value must be stored',
        'Data types must be converted',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'An algorithm is:',
      choices: [
        'A random sequence of commands',
        'A step-by-step procedure for solving a problem',
        'A physical diagram of a computer',
        'A tool for storing user data',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Debugging refers to:',
      choices: [
        'Running the program without errors',
        'Finding and fixing problems in the code',
        'Installing new software',
        'Designing graphical interfaces',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The programming process includes:',
      choices: [
        'Planning, coding, testing, and improving the solution',
        'Writing the final program immediately',
        'Designing hardware circuits',
        'Copying programs without modification',
      ],
      correctIndex: 0,
    ),

  ];
}
