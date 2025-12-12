import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'discrete_math_intermediate_clean',
    title: 'Discrete Mathematics – Intermediate',
    description:
        'Intermediate module exploring relations, functions, counting principles, logic applications, and mathematical induction.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'discrete_math_intermediate_ch1',
        title: 'Relations, Functions, Counting Principles & Logical Reasoning',
        difficultyLevel: 'Intermediate',
        summary: '''
This module develops deeper understanding of discrete structures used in computing and mathematics.

Topics include:
• Relations as sets of ordered pairs and key properties such as reflexive, symmetric, antisymmetric, and transitive  
• Functions as special relations with unique outputs, including domain, range, and common function types  
• Counting principles including the Product Rule and Sum Rule for determining possible outcomes  
• Logical reasoning using rules of inference such as Modus Ponens, Modus Tollens, and Hypothetical Syllogism  
• Mathematical induction for proving statements involving natural numbers, including the base case and inductive step  

These concepts support algorithm design, data modeling, proof construction, and computational reasoning across many areas of computer science.
''',
        content:
            'A structured discussion of relations and their properties, functions and mappings, fundamental counting techniques, logical inference, and mathematical induction used in problem solving and algorithm verification.',
        youtubeUrl: 'https://www.youtube.com/watch?v=xaxt-zNlRRg',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1SiYvXABZxzl4EL4QPXoFIYw8DyrY0Ezf',
      ),
    ],
  ),
];
