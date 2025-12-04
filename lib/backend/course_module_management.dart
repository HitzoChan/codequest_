// Backend implementation for Course/Module System functionality
import 'firestore_service.dart';
// Includes:
// - Course and Module database schema
// - API endpoints for fetching course list and module details
// - Module content delivery
// - Enrollment and completion tracking
// - Module prerequisites and learning paths

class Course {
  final String courseId;
  final String title;
  final String description;
  final List<Module> modules;
  final String difficultyLevel;

  Course({
    required this.courseId,
    required this.title,
    required this.description,
    required this.modules,
    this.difficultyLevel = 'Beginner',
  });

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseId: map['courseId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      difficultyLevel: map['difficultyLevel'] ?? 'Beginner',
      modules: (map['modules'] as List<dynamic>?)
              ?.map((m) => Module.fromMap(Map<String, dynamic>.from(m)))
              .toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'title': title,
      'description': description,
      'difficultyLevel': difficultyLevel,
      'modules': modules.map((m) => m.toMap()).toList(),
    };
  }
}

class Module {
  final String moduleId;
  final String title;
  final String content;          // your original text content
  final int orderIndex;
  final String difficultyLevel;

  // NEW FIELDS (Only once!)
  final String youtubeUrl;
  final String summary;
  final String? pdfUrl;

  Module({
    required this.moduleId,
    required this.title,
    required this.content,
    this.orderIndex = 0,
    this.difficultyLevel = 'Beginner',
    required this.youtubeUrl,
    required this.summary,
    this.pdfUrl,
  });

  factory Module.fromMap(Map<String, dynamic> map) {
    return Module(
      moduleId: map['moduleId'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      orderIndex: map['orderIndex'] ?? 0,
      difficultyLevel: map['difficultyLevel'] ?? 'Beginner',
      youtubeUrl: map['youtubeUrl'] ?? '',
      summary: map['summary'] ?? '',
      pdfUrl: map['pdfUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'moduleId': moduleId,
      'title': title,
      'content': content,
      'orderIndex': orderIndex,
      'difficultyLevel': difficultyLevel,
      'youtubeUrl': youtubeUrl,
      'summary': summary,
      'pdfUrl': pdfUrl,
    };
  }
}


class CourseModuleService {
  final FirestoreService _firestore = FirestoreService();
  final List<Course> _courses = [
    // Seed sample course and module (SQL Intro) used by the Modules screen
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
          summary: '''
SQL (Structured Query Language) is a programming language used to manage and query databases. It allows you to store, retrieve, modify, and delete data in a structured way.

Core concepts:
• Tables – store data in rows and columns
• Queries – instructions to retrieve or modify data
• SELECT – retrieve data
• WHERE – filter data
• INSERT – add new data
• UPDATE – modify data
• DELETE – remove data
''',
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
    youtubeUrl: 'https://youtu.be/MHwmmiZ5LHs?si=BYn-doKhak9evhJh', // suggested intro programming video
    summary: 'This module provides a comprehensive introduction to programming basics, covering computer architecture, algorithms, Java fundamentals, data types, variables, and essential coding concepts.',
    pdfUrl: 'https://drive.google.com/uc?export=download&id=1PJB_RGym9HPHDThWpCACGteyVh8gDMpO',
  ),
      ],
    ),
  ];
  

  Future<void> initialize() async {
    // FORCE UPDATE: Uncomment the next line to force update Firestore with latest seed data
    // This will overwrite existing Firestore data with the local seed data
    print('DEBUG: FORCE UPDATING Firestore with local seed data...');
    await _firestore.forceUpdateCourses(_courses);
    
    print('DEBUG: Fetching courses from Firestore...');
    final remote = await _firestore.fetchCourses();
    print('DEBUG: Fetched ${remote.length} courses from Firestore');
    
    if (remote.isNotEmpty) {
      // Debug: Check SQL module pdfUrl before clearing
      for (var course in _courses) {
        for (var module in course.modules) {
          if (module.moduleId == 'sql_intro_01') {
            print('DEBUG: SQL Module pdfUrl in local seed: ${module.pdfUrl}');
          }
        }
      }
      
      _courses.clear();
      _courses.addAll(remote);
      
      // Debug: Check SQL module pdfUrl after fetching
      for (var course in _courses) {
        for (var module in course.modules) {
          if (module.moduleId == 'sql_intro_01') {
            print('DEBUG: SQL Module pdfUrl after Firestore fetch: ${module.pdfUrl}');
          }
        }
      }
    }
  }

  // Create a new course with modules
  void createCourse(Course course) {
    _courses.add(course);
  }

  // Fetch list of all courses
  List<Course> getAllCourses() {
    return _courses;
  }

  Future<List<Course>> fetchCourses() async {
    return await _firestore.fetchCourses();
  }

  // Fetch course details by ID
  Course? getCourseById(String courseId) {
    return _courses.firstWhere(
      (c) => c.courseId == courseId,
      orElse: () => throw Exception('Course not found'),
    );
  }

  // Fetch module details by ID within specific course
  Module? getModuleById(String courseId, String moduleId) {
    final course = getCourseById(courseId);
    if (course != null) {
      return course.modules.firstWhere(
        (m) => m.moduleId == moduleId,
        orElse: () => throw Exception('Module not found'),
      );
    }
    return null;
  }

  // ============================
  // ENROLLMENT + COMPLETION
  // ============================
  final Map<String, List<String>> _userEnrollments = {};

  void enrollUser(String userId, String moduleId) {
    _userEnrollments.putIfAbsent(userId, () => []);
    if (!_userEnrollments[userId]!.contains(moduleId)) {
      _userEnrollments[userId]!.add(moduleId);
      // persist to firestore
      _firestore.enrollUser(userId, moduleId);
    }
  }

  bool isUserEnrolled(String userId, String moduleId) {
    return _userEnrollments[userId]?.contains(moduleId) ?? false;
  }

  final Map<String, List<String>> _userCompletions = {};

  void completeModule(String userId, String moduleId) {
    _userCompletions.putIfAbsent(userId, () => []);
    if (!_userCompletions[userId]!.contains(moduleId)) {
      _userCompletions[userId]!.add(moduleId);
      _firestore.completeModule(userId, moduleId);
    }
  }

  bool isModuleCompleted(String userId, String moduleId) {
    return _userCompletions[userId]?.contains(moduleId) ?? false;
  }

  // ============================
  // SEARCH ENGINE
  // ============================
  List<Course> searchCourses(String keyword) {
    return _courses.where((c) =>
        c.title.toLowerCase().contains(keyword.toLowerCase()) ||
        c.description.toLowerCase().contains(keyword.toLowerCase())).toList();
  }
}
