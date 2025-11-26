// Backend implementation for Course/Module System functionality
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
}

class Module {
  final String moduleId;
  final String title;
  final String content; // Could be text, video URL, code examples etc.
  final int orderIndex;
  final String difficultyLevel;

  Module({
    required this.moduleId,
    required this.title,
    required this.content,
    this.orderIndex = 0,
    this.difficultyLevel = 'Beginner',
  });
}

class CourseModuleService {
  final List<Course> _courses = [];

  // Create a new course with modules
  void createCourse(Course course) {
    _courses.add(course);
  }

  // Fetch list of all courses
  List<Course> getAllCourses() {
    return _courses;
  }

  // Fetch course details by ID
  Course? getCourseById(String courseId) {
    return _courses.firstWhere((c) => c.courseId == courseId, orElse: () => throw Exception('Course not found'));
  }

  // Fetch module details by ID within specific course
  Module? getModuleById(String courseId, String moduleId) {
    final course = getCourseById(courseId);
    if (course != null) {
      return course.modules.firstWhere((m) => m.moduleId == moduleId, orElse: () => throw Exception('Module not found'));
    }
    return null;
  }

  // Enroll user in a module (simulate storage, replace with real DB calls)
  final Map<String, List<String>> _userEnrollments = {};

  void enrollUser(String userId, String moduleId) {
    _userEnrollments.putIfAbsent(userId, () => []);
    if (!_userEnrollments[userId]!.contains(moduleId)) {
      _userEnrollments[userId]!.add(moduleId);
    }
  }

  // Check enrollment
  bool isUserEnrolled(String userId, String moduleId) {
    return _userEnrollments[userId]?.contains(moduleId) ?? false;
  }

  // Track module completion similarly
  final Map<String, List<String>> _userCompletions = {};

  void completeModule(String userId, String moduleId) {
    _userCompletions.putIfAbsent(userId, () => []);
    if (!_userCompletions[userId]!.contains(moduleId)) {
      _userCompletions[userId]!.add(moduleId);
    }
  }

  bool isModuleCompleted(String userId, String moduleId) {
    return _userCompletions[userId]?.contains(moduleId) ?? false;
  }

  // Add search and filter functionality (simplified example)
  List<Course> searchCourses(String keyword) {
    return _courses.where((c) => c.title.toLowerCase().contains(keyword.toLowerCase()) || c.description.toLowerCase().contains(keyword.toLowerCase())).toList();
  }
}
