// Backend implementation for Course/Module System functionality
import 'package:flutter/foundation.dart';
import 'firestore_service.dart';
import 'course_models.dart';
import 'modules/beginner.dart';
import 'modules/intermediate.dart';
import 'modules/advanced.dart';
// Includes:
// - Course and Module database schema
// - API endpoints for fetching course list and module details
// - Module content delivery
// - Enrollment and completion tracking
// - Module prerequisites and learning paths

// Models (Course / Module) have been moved to `course_models.dart`.
// Seeded modules are split into per-level files under `modules/` and
// composed below to form the initial `_courses` list.


class CourseModuleService {
  final FirestoreService _firestore = FirestoreService();
  // Compose seeded courses from per-level seed lists to keep code organized
  final List<Course> _courses = [
    ...beginnerCourses,
    ...intermediateCourses,
    ...advancedCourses,
  ];
  

  Future<void> initialize() async {
    // ALWAYS USE LOCAL DATA: Don't sync with Firebase for course content
    // This allows each developer to have their own modules without conflicts
    debugPrint('DEBUG: Using LOCAL course data only (no Firebase sync for modules)');
    debugPrint('DEBUG: Loaded ${_courses.length} courses from local files');
    
    // We still use Firebase for user progress (quiz attempts, scores, etc.)
    // but NOT for course/module content
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
    // Return local courses instead of fetching from Firebase
    return _courses;
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
      // mark module completed in Firestore
      _firestore.completeModule(userId, moduleId);
      // award XP for completion via addXp wrapper (50 XP)
      try {
        _firestore.addXp(userId, 50, source: 'module_completion', moduleId: moduleId);
      } catch (e) {
        // ignore: avoid_print
          debugPrint('Failed to award XP for module completion: $e');
      }
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
