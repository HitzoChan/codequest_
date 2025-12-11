import 'models.dart';

class AdvancedDigitalLiteracyQuiz {
  static List<QuizQuestion> questions = [

    QuizQuestion(
      question: 'Advanced document production focuses on:',
      choices: [
        'Creating short, unformatted notes',
        'Producing highly structured documents using advanced formatting tools',
        'Removing all graphics from documents',
        'Limiting documents to one page only',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'A table of contents generated automatically requires:',
      choices: [
        'Proper use of styles and heading levels',
        'Deleting all section breaks',
        'Writing the entire document in uppercase',
        'Removing all page numbers',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Pivot tables in spreadsheets are primarily used to:',
      choices: [
        'Create animations',
        'Summarize and categorize large datasets efficiently',
        'Design presentation slides',
        'Remove duplicate files',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'The VLOOKUP or XLOOKUP function allows users to:',
      choices: [
        'Search for data in another table and return a corresponding value',
        'Create hyperlinks automatically',
        'Delete unused rows',
        'Split documents into sections',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Advanced presentation design emphasizes:',
      choices: [
        'Overusing animations and colors to entertain the audience',
        'Clear visual hierarchy and consistent slide formatting',
        'Placing as much text as possible on each slide',
        'Avoiding multimedia elements entirely',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Slide masters are used in presentations to:',
      choices: [
        'Change the appearance of all slides consistently',
        'Automatically write speaker notes',
        'Remove transitions',
        'Edit videos inside the presentation',
      ],
      correctIndex: 0,
    ),

    QuizQuestion(
      question: 'Digital collaboration systems allow teams to:',
      choices: [
        'Work individually without communication',
        'Share documents, track tasks, and coordinate workflows',
        'Delete all previous versions of files',
        'Avoid cloud-based tools',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Version control in cloud platforms is useful because it:',
      choices: [
        'Prevents documents from being edited',
        'Tracks changes over time and restores earlier versions when needed',
        'Deletes the oldest version automatically',
        'Removes all formatting from the document',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Effective digital information management includes:',
      choices: [
        'Storing all files in one folder with no organization',
        'Structuring files, securing data, and evaluating information sources',
        'Sharing files publicly without restrictions',
        'Avoiding the use of password protections',
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: 'Digital security awareness is important because:',
      choices: [
        'Online risks are rare',
        'Users must protect sensitive data and reduce privacy threats',
        'Productivity tools automatically block all threats',
        'Only advanced programmers face security issues',
      ],
      correctIndex: 1,
    ),

  ];
}
