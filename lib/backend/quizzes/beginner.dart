import 'models.dart';

class BeginnerSysIntQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'A system is best described as:',
      choices: [
        'A single device performing tasks independently',
        'A collection of components working together toward a common goal',
        'A random group of unrelated applications',
        'A tool used only for entertainment',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which component of an information system refers to physical devices like computers and servers?',
      choices: [
        'Software',
        'Data',
        'Hardware',
        'Processes',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Software in an information system is responsible for:',
      choices: [
        'Storing physical documents',
        'Instructing hardware on what tasks to perform',
        'Replacing all hardware devices',
        'Managing employee schedules',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Data becomes useful information when:',
      choices: [
        'It is raw and unprocessed',
        'It is organized, interpreted, or processed',
        'It is deleted from the system',
        'It is printed on paper',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'People in an information system are important because they:',
      choices: [
        'Manufacture computer chips',
        'Interact with the system and make decisions',
        'Replace processes with hardware',
        'Perform only manual tasks',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'System integration is the process of:',
      choices: [
        'Separating systems so they operate independently',
        'Linking different subsystems into one unified system',
        'Deleting old applications to save storage',
        'Replacing all existing software with new versions',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A common benefit of system integration is:',
      choices: [
        'Increased data duplication',
        'More manual data entry',
        'Seamless data sharing between applications',
        'Limited communication between systems',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Application integration allows:',
      choices: [
        'Software programs to operate without data',
        'Different applications to exchange information',
        'Users to uninstall all system processes',
        'Systems to function without hardware',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'System architecture is best defined as:',
      choices: [
        'A blueprint describing how system components are organized and interact',
        'A software used to design buildings',
        'A set of instructions for printing documents',
        'The physical layout of a computer laboratory',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Why are system integration and architecture important in organizations?',
      choices: [
        'They increase system errors and inefficiency',
        'They ensure systems communicate effectively and support organizational goals',
        'They prevent systems from sharing data',
        'They eliminate the need for information technology',
      ],
      correctIndex: 1,
    ),

  ];
}
