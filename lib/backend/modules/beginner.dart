import '../course_models.dart';

final List<Course> beginnerCourses = [
  Course(
    courseId: 'mobile_dev_101',
    title: 'Mobile App Development',
    description: 'A beginner-friendly course to learn mobile app development using Flutter and common backend techniques.',
    difficultyLevel: 'Beginner',
    modules: [
      Module(
        moduleId: 'sql_intro_01',
        title: 'Introduction to SQL',
        content: '''
SQL (Structured Query Language) is a programming language used to manage and query databases.
It allows you to store, retrieve, modify, and delete data in a structured way.

Core concepts:
• Tables – store data in rows and columns
• Queries – instructions to retrieve or modify data
• SELECT – retrieve data
• WHERE – filter data
• INSERT – add new data
• UPDATE – modify data
• DELETE – remove data

Example:
SELECT name, age FROM students WHERE age > 18;

SQL is used in almost every software system that requires data storage.
''',
        youtubeUrl: 'https://www.youtube.com/watch?v=HXV3zeQKqGY',
        summary: 'SQL (Structured Query Language) is a programming language used to manage and query databases.',
        pdfUrl: 'https://drive.google.com/uc?export=download&id=1PJB_RGym9HPHDThWpCACGteyVh8gDMpO',
      ),
      Module(
        moduleId: 'computing_intro_01',
        title: 'Introduction to Computing',
        content: '''
This module introduces computing basics, architecture, hardware and software distinctions, and foundational terms used throughout technology.

It covers: CPU, Memory, Storage, Operating Systems, and simple programming concepts. This PDF has summaries and examples.
''',
        youtubeUrl: 'https://www.youtube.com/watch?v=Qfdy3pN0o5g',
        summary: 'An introductory module that covers basic computing concepts and terminology.',
        pdfUrl: 'https://drive.google.com/uc?export=download&id=1PJB_RGym9HPHDThWpCACGteyVh8gDMpO',
      ),
      Module(
        moduleId: 'programming_fundamentals_01',
        title: 'Programming Fundamentals',
        content: '''
  This module introduces the foundations of programming, based on the uploaded “Programming Fundamentals” material.

  It covers core topics such as:
  • Getting Started with Programming
  • Basic Computer Architecture
  • Programming Basics
  • Binary Number System
  • Algorithms
  • Java Basics (syntax, semantics, first programs)
  • Variables, Data Types, and Expressions
  • Input/Output
  • Conditions and Boolean Logic
  • Loops, Methods, Arrays, and Object-Oriented Programming

  The module includes explanations, examples, and exercises to help students understand essential programming concepts.
  ''',
        youtubeUrl: 'https://youtu.be/MHwmmiZ5LHs?si=BYn-doKhak9evhJh',
        summary: 'This module provides a comprehensive introduction to programming basics.',
        pdfUrl: 'https://drive.google.com/uc?export=download&id=1PJB_RGym9HPHDThWpCACGteyVh8gDMpO',
      ),
    ],
  ),
];
