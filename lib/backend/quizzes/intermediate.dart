import 'models.dart';

class IntermediateOOPQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'A constructor is used to:',
      choices: [
        'Destroy an object',
        'Initialize an object when it is created',
        'Copy an object automatically',
        'Change data types during runtime',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A parameterized constructor differs from a default constructor because it:',
      choices: [
        'Contains no code',
        'Does not have a name',
        'Accepts arguments to initialize object attributes',
        'Cannot be used in classes',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Method overloading occurs when:',
      choices: [
        'A subclass replaces a superclass method',
        'Two methods have the same name but different parameters',
        'Methods return multiple values',
        'A method is defined without a return type',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Access modifiers control:',
      choices: [
        'How many objects can be created',
        'Whether class members can be accessed publicly or privately',
        'Which superclass a class inherits from',
        'How fast the program runs',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A private variable can be accessed:',
      choices: [
        'From any class',
        'Only from the class where it is defined',
        'Only from subclasses',
        'Only from unrelated classes',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'In an aggregation relationship:',
      choices: [
        'The contained object cannot exist on its own',
        'Both objects can exist independently',
        'Only one object has methods',
        'Objects must belong to the same class',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Composition is different from aggregation because:',
      choices: [
        'Objects in composition are loosely connected',
        'The composed object depends entirely on the parent object',
        'Composition allows unrelated classes to communicate',
        'Composition is used only for static members',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A static method:',
      choices: [
        'Can be called without creating an object',
        'Requires an object to be created first',
        'Can only be used inside constructors',
        'Must return a value',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Static variables:',
      choices: [
        'Are unique to each object instance',
        'Are shared by all instances of a class',
        'Cannot store numeric values',
        'Are automatically private',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Object relationships (association, aggregation, composition) help programmers:',
      choices: [
        'Reduce the number of classes needed',
        'Model real-world interactions and structure complex systems',
        'Add errors intentionally',
        'Avoid using constructors',
      ],
      correctIndex: 1,
    ),

  ];
}
