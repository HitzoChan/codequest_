import 'models.dart';

class BeginnerCybersecurityQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Cybersecurity refers to:',
      choices: [
        'Maintaining computer hardware only',
        'Protecting systems, networks, and data from unauthorized access or attacks',
        'Creating new programming languages',
        'Installing office software',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The CIA triad stands for:',
      choices: [
        'Communication, Integrity, Administration',
        'Confidentiality, Integrity, Availability',
        'Control, Information, Access',
        'Confidentiality, Inspection, Authorization',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Confidentiality ensures that:',
      choices: [
        'Data is always backed up',
        'Only authorized individuals can access information',
        'All users have equal permissions',
        'Old files are deleted regularly',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which of the following is a type of malware?',
      choices: [
        'Phishing',
        'Worm',
        'Firewall',
        'Encryption',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Phishing attacks typically involve:',
      choices: [
        'Fake messages that trick users into revealing sensitive information',
        'Physical destruction of hardware',
        'Passwords that never expire',
        'Rewriting operating system code',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'A vulnerability is:',
      choices: [
        'A security tool used to block attackers',
        'A weakness in a system that can be exploited',
        'A strong security protocol',
        'A type of encrypted file',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Which practice helps strengthen account security the most?',
      choices: [
        'Using the same password for all accounts',
        'Writing passwords on paper',
        'Enabling multi-factor authentication',
        'Logging in through public Wi-Fi',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Regular software updates are important because they:',
      choices: [
        'Make computers run slower',
        'Remove unused apps automatically',
        'Patch security flaws and improve protection',
        'Delete browser history',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Access control refers to:',
      choices: [
        'Determining which users can access specific resources',
        'Blocking all internet connections',
        'Formatting the hard drive',
        'Installing new hardware',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Cybersecurity awareness is important because:',
      choices: [
        'Most security threats are caused by user mistakes',
        'It replaces the need for antivirus software',
        'It allows all users to become programmers',
        'It eliminates the need for passwords',
      ],
      correctIndex: 0,
    ),

  ];
}
