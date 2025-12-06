// Shared models for courses and modules used by seed files and the service
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
  final String content;
  final int orderIndex;
  final String difficultyLevel;
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
