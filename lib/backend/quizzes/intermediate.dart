import 'models.dart';

class IntermediateCybersecurityQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'A firewall is primarily used to:',
      choices: [
        'Store passwords securely',
        'Filter network traffic and block unauthorized access',
        'Repair damaged hardware',
        'Speed up internet browsing',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'IDS (Intrusion Detection System) is used to:',
      choices: [
        'Automatically delete malware',
        'Monitor network activity and alert when suspicious behavior is detected',
        'Replace antivirus software',
        'Encrypt all data in the network',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Symmetric encryption uses:',
      choices: [
        'A pair of public and private keys',
        'A single shared key for both encryption and decryption',
        'No keys at all',
        'Biometrics for authentication',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Asymmetric encryption differs because it:',
      choices: [
        'Uses only passwords',
        'Uses two keys: one public and one private',
        'Does not protect data during transmission',
        'Works only on local networks',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Cybercriminals are threat actors typically motivated by:',
      choices: [
        'Entertainment',
        'Financial gain',
        'Environmental concerns',
        'System maintenance',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Insider threats occur when:',
      choices: [
        'A hacker breaks in from another country',
        'Someone inside the organization misuses access or accidentally causes harm',
        'A server runs out of storage',
        'A user creates strong passwords',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Security policies exist to:',
      choices: [
        'Reduce the number of employees',
        'Provide rules that guide safe use of organizational systems',
        'Prevent users from browsing the internet',
        'Replace firewalls and antivirus software',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Incident response begins with which phase?',
      choices: [
        'Containment',
        'Detection',
        'Preparation',
        'Recovery',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'The goal of containment during incident response is to:',
      choices: [
        'Punish the attacker',
        'Limit damage and prevent the attack from spreading',
        'Restore all data immediately',
        'Upgrade all hardware',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Post-incident analysis is important because it:',
      choices: [
        'Ensures the attack never happened',
        'Helps identify lessons learned and prevents future incidents',
        'Rewrites all security policies',
        'Removes encryption from the system',
      ],
      correctIndex: 1,
    ),

  ];
}
