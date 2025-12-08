import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../backend/firestore_service.dart';
import '../backend/course_module_api.dart';
import '../utils/page_transitions.dart';
import 'home_screen.dart';
import 'modules_screen.dart';
import 'profile_screen.dart';
// removed unused chart import

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final FirestoreService _fs = FirestoreService();
  final CourseModuleAPI _api = CourseModuleAPI();
  
  int _currentLevel = 12;
  int _progressPercentage = 0;
  
  // Per-difficulty tracking
  int _beginnerCompleted = 0;
  int _beginnerTotal = 0;
  int _intermediateCompleted = 0;
  int _intermediateTotal = 0;
  int _advancedCompleted = 0;
  int _advancedTotal = 0;
  
  // Stats for bottom cards
  int _modulesCompleted = 0;
  int _totalModules = 0;
  int _quizzesPassed = 0;
  
  // Recent activity
  List<Map<String, dynamic>> _recentActivities = [];

  @override
  void initState() {
    super.initState();
    _loadProgressData();
  }

  Future<void> _loadProgressData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    
    // Get all courses and count modules per difficulty
    final courses = _api.getCourses();
    int totalBeginner = 0, totalIntermediate = 0, totalAdvanced = 0;
    for (final course in courses) {
      for (final module in course.modules) {
        if (module.difficultyLevel == 'Beginner') {
          totalBeginner++;
        } else if (module.difficultyLevel == 'Intermediate') {
          totalIntermediate++;
        } else if (module.difficultyLevel == 'Advanced') {
          totalAdvanced++;
        }
      }
    }
    
    if (uid == null) {
      setState(() {
        _currentLevel = 1;
        _progressPercentage = 0;
        _beginnerCompleted = 0;
        _beginnerTotal = totalBeginner > 0 ? totalBeginner : 3;
        _intermediateCompleted = 0;
        _intermediateTotal = totalIntermediate > 0 ? totalIntermediate : 3;
        _advancedCompleted = 0;
        _advancedTotal = totalAdvanced > 0 ? totalAdvanced : 3;
        _modulesCompleted = 0;
        _totalModules = totalBeginner + totalIntermediate + totalAdvanced;
        _quizzesPassed = 0;
        _recentActivities = [];
      });
      return;
    }

    try {
      final attempts = await _fs.fetchQuizAttemptsForUser(uid);
      final stats = await _fs.recalculateLearningStatsForUser(uid);
      
      final totalModules = (stats['totalModules'] is int) ? stats['totalModules'] as int : 9;
      final modulesCompleted = (stats['modulesCompleted'] is int) ? stats['modulesCompleted'] as int : 0;
      
      // Map passed quizzes to difficulty levels
      final Map<String, bool> passedByModule = {};
      List<Map<String, dynamic>> activities = [];
      
      for (final attempt in attempts) {
        final quizId = attempt['quizId'] as String?;
        final passed = attempt['passed'] as bool? ?? false;
        final timestamp = attempt['timestamp'] as Timestamp?;
        final quizName = attempt['quizName'] as String? ?? 'Quiz';
        
        if (quizId != null && passed) {
          passedByModule[quizId] = true;
          
          // Add quiz activity
          activities.add({
            'type': 'quiz',
            'title': quizName,
            'subtitle': 'Passed Quiz',
            'timestamp': timestamp,
          });
          
          // Find module name for this quiz
          for (final course in courses) {
            for (final module in course.modules) {
              if (module.moduleId == quizId) {
                activities.add({
                  'type': 'module',
                  'title': module.title,
                  'subtitle': 'Completed Module',
                  'timestamp': timestamp,
                });
                break;
              }
            }
          }
        }
      }
      
      // Sort activities by timestamp (most recent first) and take top 5
      activities.sort((a, b) {
        final aTime = a['timestamp'] as Timestamp?;
        final bTime = b['timestamp'] as Timestamp?;
        if (aTime == null) return 1;
        if (bTime == null) return -1;
        return bTime.compareTo(aTime);
      });
      
      final recentActivities = activities.take(5).toList();
      
      // Count completed modules by difficulty
      int completedBeginner = 0, completedIntermediate = 0, completedAdvanced = 0;
      for (final course in courses) {
        for (final module in course.modules) {
          if (passedByModule.containsKey(module.moduleId)) {
            if (module.difficultyLevel == 'Beginner') {
              completedBeginner++;
            } else if (module.difficultyLevel == 'Intermediate') {
              completedIntermediate++;
            } else if (module.difficultyLevel == 'Advanced') {
              completedAdvanced++;
            }
          }
        }
      }
      
      final percentage = totalModules > 0 ? ((modulesCompleted / totalModules) * 100).toInt() : 0;
      
      // Count passed quizzes
      int passedQuizzes = passedByModule.length;
      
      if (!mounted) return;
      setState(() {
        _currentLevel = modulesCompleted > 0 ? modulesCompleted : 1;
        _progressPercentage = percentage.clamp(0, 100);
        _beginnerCompleted = completedBeginner;
        _beginnerTotal = totalBeginner > 0 ? totalBeginner : 3;
        _intermediateCompleted = completedIntermediate;
        _intermediateTotal = totalIntermediate > 0 ? totalIntermediate : 3;
        _advancedCompleted = completedAdvanced;
        _advancedTotal = totalAdvanced > 0 ? totalAdvanced : 3;
        _modulesCompleted = modulesCompleted;
        _totalModules = totalModules;
        _quizzesPassed = passedQuizzes;
        _recentActivities = recentActivities;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _currentLevel = 1;
        _progressPercentage = 0;
        _beginnerCompleted = 0;
        _beginnerTotal = totalBeginner > 0 ? totalBeginner : 3;
        _intermediateCompleted = 0;
        _intermediateTotal = totalIntermediate > 0 ? totalIntermediate : 3;
        _advancedCompleted = 0;
        _advancedTotal = totalAdvanced > 0 ? totalAdvanced : 3;
        _modulesCompleted = 0;
        _totalModules = totalBeginner + totalIntermediate + totalAdvanced;
        _quizzesPassed = 0;
        _recentActivities = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A3A52), Color(0xFF0D1F2D)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(
              screenWidth * 0.05 > 20 ? 20 : screenWidth * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(
                    screenWidth * 0.06 > 20 ? 20 : screenWidth * 0.06,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF7EC8E3), Color(0xFF5AB4D8)],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Progress',
                              style: TextStyle(
                                fontSize: screenWidth * 0.07 > 28
                                    ? 28
                                    : screenWidth * 0.07,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: screenWidth * 0.01 > 12
                                  ? 12
                                  : screenWidth * 0.01,
                            ),
                            Text(
                              'Keep up the great work!',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04 > 16
                                    ? 16
                                    : screenWidth * 0.04,
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(
                          screenWidth * 0.04 > 16 ? 16 : screenWidth * 0.04,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.trending_up,
                          color: Colors.white,
                          size: screenWidth * 0.1 > 48 ? 48 : screenWidth * 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenWidth * 0.05 > 20 ? 20 : screenWidth * 0.05,
                ),

                // Level and XP Cards
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(
                          screenWidth * 0.05 > 20 ? 20 : screenWidth * 0.05,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.05 > 20 ? 20 : screenWidth * 0.05,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                screenWidth * 0.015 > 12
                                    ? 12
                                    : screenWidth * 0.015,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(52, 141, 188, 0.1),
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.015 > 12
                                      ? 12
                                      : screenWidth * 0.015,
                                ),
                              ),
                              child: Icon(
                                Icons.emoji_events,
                                color: const Color.fromRGBO(52, 141, 188, 1),
                                size: screenWidth * 0.04 > 32
                                    ? 32
                                    : screenWidth * 0.04,
                              ),
                            ),
                            SizedBox(
                              height: screenWidth * 0.03 > 20
                                  ? 20
                                  : screenWidth * 0.03,
                            ),
                            Text(
                              '$_currentLevel',
                              style: TextStyle(
                                fontSize: screenWidth * 0.07 > 28
                                    ? 28
                                    : screenWidth * 0.07,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(52, 141, 188, 1),
                              ),
                            ),
                            Text(
                              'Current Level',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035 > 14
                                    ? 14
                                    : screenWidth * 0.035,
                                color: const Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03 > 20 ? 20 : screenWidth * 0.03,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(
                          screenWidth * 0.05 > 20 ? 20 : screenWidth * 0.05,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.05 > 20 ? 20 : screenWidth * 0.05,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                screenWidth * 0.015 > 12
                                    ? 12
                                    : screenWidth * 0.015,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFF4CAF50,
                                ).withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.015 > 12
                                      ? 12
                                      : screenWidth * 0.015,
                                ),
                              ),
                              child: Icon(
                                Icons.stars,
                                color: const Color(0xFF4CAF50),
                                size: screenWidth * 0.04 > 32
                                    ? 32
                                    : screenWidth * 0.04,
                              ),
                            ),
                            SizedBox(
                              height: screenWidth * 0.03 > 20
                                  ? 20
                                  : screenWidth * 0.03,
                            ),
                            Text(
                              '$_progressPercentage%',
                              style: TextStyle(
                                fontSize: screenWidth * 0.07 > 28
                                    ? 28
                                    : screenWidth * 0.07,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF4CAF50),
                              ),
                            ),
                            Text(
                              'Overall Progress',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035 > 14
                                    ? 14
                                    : screenWidth * 0.035,
                                color: const Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenWidth * 0.05 > 20 ? 20 : screenWidth * 0.05,
                ),

                // (Removed Weekly XP chart - focusing on Modules and Quizzes)

                // Module Completion
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Module Completion',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          Text(
                            '$_progressPercentage%',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(52, 141, 188, 1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildModuleProgress(
                        'Beginner',
                        _beginnerCompleted,
                        _beginnerTotal,
                        const Color(0xFF4CAF50),
                      ),
                      const SizedBox(height: 16),
                      _buildModuleProgress(
                        'Intermediate',
                        _intermediateCompleted,
                        _intermediateTotal,
                        const Color.fromRGBO(52, 141, 188, 1),
                      ),
                      const SizedBox(height: 16),
                      _buildModuleProgress(
                        'Advanced',
                        _advancedCompleted,
                        _advancedTotal,
                        Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Stats Row
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 180,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF6B9D), Color(0xFFFF8FAB)],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFFFF6B9D,
                                ).withValues(alpha: 0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.library_books,
                                color: Colors.white,
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '$_modulesCompleted/$_totalModules',
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Modules',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 180,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(52, 141, 188, 1),
                                Color(0xFF5AB4D8),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(52, 141, 188, 0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.quiz_outlined,
                                color: Colors.white,
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '$_quizzesPassed',
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Quizzes Passed',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Achievements removed to focus on Modules and Quizzes
                const SizedBox(height: 20),

                // Recent Activity
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recent Activity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (_recentActivities.isEmpty)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'No recent activity yet',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ),
                        )
                      else
                        ..._recentActivities.asMap().entries.map((entry) {
                          final index = entry.key;
                          final activity = entry.value;
                          final type = activity['type'] as String;
                          final title = activity['title'] as String? ?? 'Activity';
                          final subtitle = activity['subtitle'] as String? ?? '';
                          final timestamp = activity['timestamp'] as Timestamp?;
                          
                          // Format timestamp
                          String timeString = 'Today';
                          if (timestamp != null) {
                            final now = DateTime.now();
                            final date = timestamp.toDate();
                            final difference = now.difference(date);
                            
                            if (difference.inDays == 0) {
                              timeString = 'Today';
                            } else if (difference.inDays == 1) {
                              timeString = 'Yesterday';
                            } else if (difference.inDays < 7) {
                              timeString = '${difference.inDays} days ago';
                            } else {
                              timeString = '${(difference.inDays / 7).floor()} weeks ago';
                            }
                          }
                          
                          // Icon and color based on type
                          IconData icon;
                          Color color;
                          if (type == 'quiz') {
                            icon = Icons.check_circle;
                            color = const Color(0xFF4CAF50);
                          } else {
                            icon = Icons.emoji_events;
                            color = const Color.fromRGBO(52, 141, 188, 1);
                          }
                          
                          return Column(
                            children: [
                              if (index > 0) const SizedBox(height: 12),
                              _buildActivityItem(icon, color, subtitle, title, timeString),
                            ],
                          );
                        }),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, 2),
    );
  }

  // Bar chart removed; helper removed.

  Widget _buildModuleProgress(
    String level,
    int completed,
    int total,
    Color color,
  ) {
    final progress = total > 0 ? (completed / total).clamp(0.0, 1.0) : 0.0;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              level,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),
            Text(
              '$completed/$total',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

  // Achievements removed; helper removed.

  Widget _buildActivityItem(
    IconData icon,
    Color color,
    String title,
    String subtitle,
    String time,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
              ),
            ],
          ),
        ),
        Text(
          time,
          style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar(BuildContext context, int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(30, 30, 30, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(context, Icons.home, 'Home', 0, currentIndex),
              _buildNavItem(context, Icons.book_outlined, 'Modules', 1, currentIndex),
              _buildNavItem(context, Icons.trending_up, 'Progress', 2, currentIndex),
              _buildNavItem(context, Icons.person_outline, 'Profile', 3, currentIndex),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
    int currentIndex,
  ) {
    final isSelected = index == currentIndex;
    return GestureDetector(
      onTap: () {
        if (isSelected) return; // Don't navigate if already on current screen
        switch (index) {
          case 0:
            Navigator.pushReplacement(context, SmoothPageRoute(page: HomeScreen()));
            break;
          case 1:
            Navigator.pushReplacement(context, SmoothPageRoute(page: ModulesScreen()));
            break;
          case 2:
            break; // Already on progress
          case 3:
            Navigator.pushReplacement(context, SmoothPageRoute(page: ProfileScreen()));
            break;
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(52, 141, 188, 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color.fromRGBO(52, 141, 188, 1)
                  : Colors.grey.shade500,
              size: 26,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isSelected
                    ? const Color.fromRGBO(52, 141, 188, 1)
                    : Colors.grey.shade500,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
