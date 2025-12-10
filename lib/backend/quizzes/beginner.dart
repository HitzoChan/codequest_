import 'models.dart';

class BeginnerIntroComputingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Computing is best described as:',
      choices: [
        'The study of plants and animals',
        'The use of computers to process information and solve problems',
        'The repair of electronic devices',
        'The design of artwork',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Hardware refers to:',
      choices: [
        'The instructions that tell a computer what to do',
        'The physical components of a computer system',
        'The people who use a computer',
        'The documents stored on a computer',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following is an example of system software?',
      choices: [
        'Video editing application',
        'Mobile game',
        'Operating system',
        'Web browser extension',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Data becomes information when:',
      choices: [
        'It is stored in a cabinet',
        'It is processed and given meaning',
        'It is copied multiple times',
        'It is converted to graphics',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A device such as a keyboard or touchscreen is used for:',
      choices: [
        'Storage',
        'Input',
        'Output',
        'Processing',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A computer displaying information through a monitor is performing:',
      choices: [
        'Input',
        'Output',
        'Data cleaning',
        'Searching',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Personal computers such as laptops are designed for:',
      choices: [
        'Large scientific simulations',
        'Individual, everyday use',
        'Managing network servers',
        'Only gaming purposes',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which type of computer is used to host websites and manage network resources?',
      choices: [
        'Mobile device',
        'Supercomputer',
        'Personal computer',
        'Server',
      ],
      correctIndex: 3,
    ),

    QuizQuestion(
      question: 'Storage devices such as SSDs and cloud storage are used to:',
      choices: [
        'Display information visibly',
        'Store data for future use',
        'Increase internet speed',
        'Print documents',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Why is computing important in society?',
      choices: [
        'It replaces the need for communication',
        'It supports business operations, education, healthcare, and daily life',
        'It is used only for entertainment',
        'It reduces the need for electricity',
      ],
      correctIndex: 1,
    ),

  ];
}
