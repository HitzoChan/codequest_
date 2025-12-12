import '../course_models.dart';

final List<Course> advancedCourses = [
  Course(
    courseId: 'se_advanced_clean',
    title: 'Software Engineering – Advanced',
    description:
        'Advanced module focusing on software quality attributes, testing strategies, documentation, configuration management, and process improvement models.',
    difficultyLevel: 'Advanced',
    modules: [
      Module(
        moduleId: 'se_advanced_ch1',
        title: 'Software Quality, Testing Strategies, SCM & Process Improvement',
        difficultyLevel: 'Advanced',
        summary: '''
This module explores advanced practices that ensure software reliability, long-term maintainability, and high development standards.

Topics include:
• Software quality and essential quality attributes such as reliability, maintainability, usability, efficiency, and security  
• Trade-offs involved in engineering decisions that influence software quality  
• Testing levels including unit, integration, system, and acceptance testing  
• Testing methods such as black-box testing, white-box testing, and regression testing  
• Importance of test documentation including test plans, test cases, and reports  
• Software Configuration Management (SCM) for tracking, controlling, and managing software changes  
• Version control systems that support collaboration, traceability, and rollback capabilities  
• Software process improvement models such as CMMI and ISO 9001 to enhance workflow efficiency and quality  

This module prepares learners for advanced roles in quality assurance, configuration management, and engineering leadership.
''',
        content:
            'An in-depth look at software quality, multi-level testing strategies, documentation practices, configuration management systems, and process improvement frameworks that strengthen large-scale software development.',
        youtubeUrl: 'https://www.youtube.com/watch?v=g4bJn03k8YA',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1LQGy0yhSksdeCd-sOTGdBnmtLeSBj_kD',
      ),
    ],
  ),
];
