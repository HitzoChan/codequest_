import 'models.dart';

class AdvancedOOPQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'An abstract class is best described as:',
      choices: [
        'A class that can be instantiated directly',
        'A class that provides partial implementation and may include abstract methods',
        'A class with only private methods',
        'A class used only for storing variables',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A method declared in an interface must be:',
      choices: [
        'Implemented in any class that uses the interface',
        'Ignored by subclasses',
        'Automatically implemented by the compiler',
        'Used only for exceptions',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Interfaces are useful in OOP because they:',
      choices: [
        'Replace the need for classes',
        'Define required behaviors without specifying how they should be implemented',
        'Contain full method implementations',
        'Prevent inheritance entirely',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Exception handling is used to:',
      choices: [
        'Make code run faster',
        'Respond gracefully to runtime errors and prevent program crashes',
        'Replace all debugging steps',
        'Avoid writing constructors',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The try–catch block is used to:',
      choices: [
        'Declare variables',
        'Handle exceptions and control how errors are processed',
        'Define class inheritance',
        'Create static methods',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Dynamic binding occurs when:',
      choices: [
        'The method executed is determined at compile time',
        'The method executed is determined at runtime based on the object type',
        'Only overloaded methods are used',
        'A class has no methods at all',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Polymorphism allows objects to:',
      choices: [
        'Share identical behavior in all situations',
        'Respond differently to the same method call depending on the object',
        'Inherit from multiple classes only',
        'Avoid using interfaces',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The Single Responsibility Principle states that:',
      choices: [
        'A class should handle many unrelated tasks',
        'A class should have only one clear purpose',
        'A class should never change',
        'A class must implement at least one interface',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The Open/Closed Principle means that:',
      choices: [
        'Code should never be extended',
        'Software should be open for extension but closed for modification',
        'Only abstract classes may be used',
        'Methods must always be private',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The Dependency Inversion Principle encourages:',
      choices: [
        'High-level modules depending directly on low-level modules',
        'Both high-level and low-level modules depending on abstractions',
        'Eliminating interfaces entirely',
        'Writing programs without OOP concepts',
      ],
      correctIndex: 1,
    ),

  ];
}
