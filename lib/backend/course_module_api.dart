// Simulated API endpoints for Course/Module System

import 'course_module_management.dart';

class CourseModuleAPI {
  final CourseModuleService _service = CourseModuleService();

  // API endpoint to get all courses
  List<Course> getCourses() {
    return _service.getAllCourses();
  }

  // API endpoint to get details of a specific course by ID
  Course? getCourseDetails(String courseId) {
    try {
      return _service.getCourseById(courseId);
    } catch (e) {
      return null;
    }
  }

  // API endpoint to get details of a specific module
  Module? getModuleDetails(String courseId, String moduleId) {
    try {
      return _service.getModuleById(courseId, moduleId);
    } catch (e) {
      return null;
    }
  }

  // API endpoint for user to enroll in a module
  void enrollInModule(String userId, String moduleId) {
    _service.enrollUser(userId, moduleId);
  }

  // API endpoint to mark module as complete for a user
  void completeModule(String userId, String moduleId) {
    _service.completeModule(userId, moduleId);
  }

  // API endpoint to check if user is enrolled in module
  bool checkEnrollment(String userId, String moduleId) {
    return _service.isUserEnrolled(userId, moduleId);
  }

  // API endpoint to check if user completed module
  bool checkCompletion(String userId, String moduleId) {
    return _service.isModuleCompleted(userId, moduleId);
  }

  // API endpoint for searching courses by keyword
  List<Course> searchCourses(String keyword) {
    return _service.searchCourses(keyword);
  }
}
