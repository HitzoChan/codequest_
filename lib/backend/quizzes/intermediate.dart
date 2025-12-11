import 'models.dart';

class IntermediateProgrammingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Control structures are important in programming because they:',
      choices: [
        'Store data permanently',
        'Determine the logical flow and decision-making of a program',
        'Replace the need for functions',
        'Automatically fix syntax errors',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Nested conditionals are used when a program must:',
      choices: [
        'Execute only one fixed outcome',
        'Store multiple values in a single variable',
        'Make more complex decisions based on multiple conditions',
        'Stop immediately after execution',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A loop is most useful when:',
      choices: [
        'A task needs to be repeated many times',
        'Only one value must be printed',
        'The program must not allow repetition',
        'The program contains no variables',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Modular programming improves code because it:',
      choices: [
        'Hides all program logic',
        'Groups tasks into reusable functions or modules',
        'Prevents programmers from using parameters',
        'Eliminates the need for debugging',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A function parameter allows a program to:',
      choices: [
        'Delete variables automatically',
        'Send values into a function for processing',
        'Block interaction with other modules',
        'Close the program after execution',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Arrays are used to:',
      choices: [
        'Store a single value only',
        'Replace the need for functions',
        'Store multiple related values under one variable name',
        'Prevent loops from executing',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Accessing the third element of an array usually requires:',
      choices: [
        'Using index 3',
        'Using index 0',
        'Using index 2',
        'Using index 1',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'File handling is important because it:',
      choices: [
        'Allows data to be saved and retrieved outside the program’s temporary memory',
        'Prevents programs from storing information',
        'Eliminates the need for variables',
        'Automatically creates backup files',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'The first step before reading or writing to a file is to:',
      choices: [
        'Delete the file',
        'Open the file using the correct mode',
        'Run a loop',
        'Search for array values',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Combining arrays, loops, functions, and file handling allows:',
      choices: [
        'Only simple programs with limited features',
        'Programs that cannot store data',
        'More complex and efficient solutions to real-world problems',
        'Removal of all control structures',
      ],
      correctIndex: 2,
    ),

  ];
}
