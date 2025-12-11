import 'models.dart';

class AdvancedProgrammingQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Object-oriented programming helps manage complex programs by:',
      choices: [
        'Removing the need for functions',
        'Structuring software around objects that combine data and behavior',
        'Storing all program data in one variable',
        'Only using low-level machine instructions',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Encapsulation improves program reliability by:',
      choices: [
        'Allowing unrestricted access to all variables',
        'Hiding internal details and exposing only necessary operations',
        'Removing methods from a class',
        'Preventing object creation',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Inheritance is the OOP principle that allows a class to:',
      choices: [
        'Hide all its attributes',
        'Acquire properties and methods from another class',
        'Execute multiple tasks at once',
        'Replace recursion completely',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Polymorphism enables a method to:',
      choices: [
        'Only work with one specific object',
        'Behave differently depending on the object calling it',
        'Store multiple data types at once',
        'Block inheritance from occurring',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Exception handling is important because it:',
      choices: [
        'Removes the need for debugging',
        'Prevents all user errors',
        'Allows programs to respond safely to unexpected conditions',
        'Automatically fixes all logic mistakes',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'A recursive function is one that:',
      choices: [
        'Calls itself to solve smaller parts of a problem',
        'Must contain no base case',
        'Cannot use parameters',
        'Runs only once',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'The base case in recursion:',
      choices: [
        'Causes infinite repetition',
        'Stops the recursive calls and prevents endless loops',
        'Deletes the function from memory',
        'Removes parameters from the call',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A stack is a data structure that follows which principle?',
      choices: [
        'First-in, first-out (FIFO)',
        'Last-in, first-out (LIFO)',
        'Largest-value priority',
        'Circular indexing only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A queue is most useful for tasks that require:',
      choices: [
        'Processing the newest item first',
        'Reversing elements frequently',
        'Handling items in the order they arrive',
        'Calling functions recursively',
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: 'Linked lists differ from arrays because they:',
      choices: [
        'Store elements in connected nodes rather than contiguous memory',
        'Cannot store more than three values',
        'Require multi-level inheritance',
        'Are only used in graphical applications',
      ],
      correctIndex: 0,
    ),

  ];
}
