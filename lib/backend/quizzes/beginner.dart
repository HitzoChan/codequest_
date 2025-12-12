import 'models.dart';

class BeginnerOOPQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Object-Oriented Programming (OOP) is primarily based on:',
      choices: [
        'Mathematical equations',
        'Organizing programs around objects that contain data and behavior',
        'Writing long procedural functions',
        'Using only built-in commands',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A class is best described as:',
      choices: [
        'A single variable',
        'A blueprint for creating objects',
        'A method that performs calculations',
        'A piece of hardware in a computer',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'An object is:',
      choices: [
        'A printed document',
        'An instance created from a class',
        'A comment in the code',
        'A type of programming error',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Attributes in a class represent:',
      choices: [
        'Actions an object can perform',
        'Data or characteristics of an object',
        'Errors that stop the program',
        'The main function of a program',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Methods in a class refer to:',
      choices: [
        'Data stored in the object',
        'Visual elements only',
        'Functions that define an object’s behavior',
        'Items unrelated to the class',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Encapsulation means:',
      choices: [
        'Allowing all data to be accessed freely',
        'Keeping data and methods together and protecting internal data',
        'Removing variables from classes',
        'Exposing all attributes publicly',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Inheritance allows a class to:',
      choices: [
        'Create multiple main functions',
        'Acquire attributes and methods from another class',
        'Store data in arrays only',
        'Delete data from the parent class',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Polymorphism allows objects to:',
      choices: [
        'Behave in the same way regardless of context',
        'Respond differently to the same method call',
        'Contain no data',
        'Avoid using methods',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Method overriding occurs when:',
      choices: [
        'A method is deleted from the superclass',
        'A subclass provides its own version of a superclass method',
        'A variable is created multiple times',
        'A class does not have a constructor',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Abstraction helps programmers by:',
      choices: [
        'Hiding essential features',
        'Hiding unneeded details and showing only what is important',
        'Preventing classes from being created',
        'Removing all data from methods',
      ],
      correctIndex: 1,
    ),

  ];
}
