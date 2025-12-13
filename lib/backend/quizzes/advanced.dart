import 'models.dart';

class AdvancedCybersecurityQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'An Advanced Persistent Threat (APT) is best described as:',
      choices: [
        'A short-term attack that causes immediate shutdown',
        'A long-term, targeted attack designed to stay hidden',
        'A type of physical security breach',
        'A simple malware infection',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A zero-day exploit targets:',
      choices: [
        'Software vulnerabilities that have already been patched',
        'Hardware devices only',
        'A vulnerability that is unknown to vendors and has no fix yet',
        'End users who forget their passwords',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A Man-in-the-Middle (MITM) attack involves:',
      choices: [
        'Encrypting files without permission',
        'Intercepting communication between two parties',
        'Using stolen hardware',
        'Preventing users from logging out',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Hashing is primarily used for:',
      choices: [
        'Reversing encrypted data',
        'Protecting data integrity by generating a one-way fixed-size output',
        'Storing full copies of files',
        'Speeding up internet traffic',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A digital signature helps verify:',
      choices: [
        'File size',
        'The authenticity and integrity of a message',
        'The number of users in a network',
        'Which device is fastest',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Zero Trust Architecture assumes that:',
      choices: [
        'All users inside the network are trustworthy',
        'No user or device is trusted by default',
        'Firewalls are unnecessary',
        'Passwords do not need to be secure',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A SIEM system is used to:',
      choices: [
        'Provide free antivirus updates',
        'Collect and analyze security logs for threat detection',
        'Manage employee schedules',
        'Format storage devices',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Ethical hacking involves:',
      choices: [
        'Breaking into systems illegally',
        'Testing systems for vulnerabilities with authorization',
        'Removing all encryption from a network',
        'Interrupting user activities',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The first phase of a penetration test is typically:',
      choices: [
        'Reporting',
        'Exploitation',
        'Reconnaissance',
        'Cleanup',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'The NIST Cybersecurity Framework includes which of the following functions?',
      choices: [
        'Scan, Report, Clean',
        'Identify, Protect, Detect, Respond, Recover',
        'Encrypt, Patch, Install',
        'Analyze, Recycle, Reboot',
      ],
      correctIndex: 1,
    ),

  ];
}
