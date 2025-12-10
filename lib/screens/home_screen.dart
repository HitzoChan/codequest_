import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../backend/firestore_service.dart';
import '../backend/course_module_api.dart';
import '../backend/course_models.dart';
import '../backend/quizzes/beginner.dart';
import '../backend/quizzes/intermediate.dart';
import '../backend/quizzes/advanced.dart';
import '../utils/page_transitions.dart';
import 'modules_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirestoreService _fs = FirestoreService();
  final CourseModuleAPI _api = CourseModuleAPI();

  int _modulesCompleted = 0;
  int _totalModules = 0;
  int _levelNumber = 1;
  String _levelLabel = 'Beginner';
  int _hearts = 5;
  double _moduleProgress = 0.0;
  String _displayName = 'Explorer';
  String _continueTitle = 'Introduction to React Native';
  double _continueProgress = 0.0;
  Module? _continueModule;
  int _quizzesDone = 0;
  int _lessonsDone = 0;
  String _totalProgressLabel = '0%';

  @override
  void initState() {
    super.initState();
    _loadLevel();
    _loadHearts();
    _loadUserName();
    _loadContinueLesson();
  }

  Future<void> _loadContinueLesson() async {
    // Default fallback
    String title = 'Keep learning';
    double pct = 0.0;
    Module? selectedModule;
    int attemptsCount = _quizzesDone;

    final courses = _api.getCourses();

    // If not signed in, pick the first module
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      if (courses.isNotEmpty && courses.first.modules.isNotEmpty) {
        title = courses.first.modules.first.title;
        selectedModule = courses.first.modules.first;
      }
      setState(() {
        _continueTitle = title;
        _continueProgress = pct;
        _continueModule = selectedModule;
        _quizzesDone = attemptsCount;
      });
      return;
    }

    try {
      final attempts = await _fs.fetchQuizAttemptsForUser(uid);
      attemptsCount = attempts.length;

      // Track latest score/passed per quizId
      final Map<String, int> latestScore = {};
      final Set<String> latestPassed = {};
      final Map<String, DateTime?> latestAt = {};

      for (final a in attempts) {
        final quizId = a['quizId'] as String?;
        if (quizId == null) continue;

      // Map old module IDs to new consolidated IDs
      String normalizedQuizId = quizId;
      if (quizId == 'sql_intro_01' || quizId == 'computing_intro_01' || quizId == 'programming_fundamentals_01' || quizId == 'programming_fundamentals_beginner_01' || quizId == 'intro_to_web_dev_01' || quizId == 'intro_to_python_01' || quizId == 'web_dev_ch1_pdf') {
        normalizedQuizId = 'intro_computing_beginner_ch1';
      }
      if (quizId == 'web_development_01' || quizId == 'python_intermediate_01' || quizId == 'web_dev_intermediate_ch1') {
        normalizedQuizId = 'intro_computing_intermediate_ch1';
      }
      if (quizId == 'data_structures_advanced_01' || quizId == 'python_advanced_01') {
        normalizedQuizId = 'intro_computing_advanced_ch1';
      }        final scoreVal = a['score'];
        final passed = a['passed'] as bool? ?? false;
        DateTime? attemptedAt;
        final attemptedRaw = a['attemptedAt'];
        try {
          if (attemptedRaw is DateTime) {
            attemptedAt = attemptedRaw;
          } else if (attemptedRaw != null) {
            try {
              attemptedAt = (attemptedRaw as dynamic).toDate() as DateTime;
            } catch (_) {
              if (attemptedRaw is int) {
                attemptedAt = DateTime.fromMillisecondsSinceEpoch(attemptedRaw);
              } else if (attemptedRaw is String) {
                attemptedAt = DateTime.tryParse(attemptedRaw);
              }
            }
          }
        } catch (_) {
          attemptedAt = null;
        }

        final shouldReplace = latestAt[normalizedQuizId] == null || (attemptedAt != null && latestAt[normalizedQuizId] != null && attemptedAt.isAfter(latestAt[normalizedQuizId]!)) || (attemptedAt != null && latestAt[normalizedQuizId] == null);
        if (shouldReplace) {
          latestAt[normalizedQuizId] = attemptedAt;
          latestScore[normalizedQuizId] = scoreVal is int ? scoreVal : (scoreVal is num ? scoreVal.toInt() : 0);
          if (passed) {
            latestPassed.add(normalizedQuizId);
          } else {
            latestPassed.remove(normalizedQuizId);
          }
        }
      }

      // helper: total questions per moduleId
      int totalFor(String moduleId) {
          if (moduleId == 'intro_computing_beginner_ch1') return BeginnerIntroComputingQuiz.questions.length;
          if (moduleId == 'intro_computing_intermediate_ch1') return IntermediateIntroComputingQuiz.questions.length;
        if (moduleId == 'intro_computing_advanced_ch1') return AdvancedIntroComputingQuiz.questions.length;
        return 0;
      }

      // Find first module not passed, in course order
      bool found = false;
      for (final course in courses) {
        for (final module in course.modules) {
          final id = module.moduleId;
          final passed = latestPassed.contains(id);
          final total = totalFor(id);
          final score = (latestScore[id] ?? 0).clamp(0, total);
          final progress = total > 0 ? (score / total).clamp(0.0, 1.0) : 0.0;
          if (!passed) {
            title = module.title;
            pct = progress;
            selectedModule = module;
            found = true;
            break;
          }
        }
        if (found) break;
      }

      // If all are passed, keep last progress as 1.0 on last module
      if (!found) {
        title = courses.isNotEmpty && courses.first.modules.isNotEmpty ? courses.first.modules.last.title : title;
        selectedModule = courses.isNotEmpty && courses.first.modules.isNotEmpty ? courses.first.modules.last : selectedModule;
        pct = 1.0;
      }
    } catch (_) {
      // fallback keeps defaults
    }

    if (!mounted) return;
    setState(() {
      _continueTitle = title;
      _continueProgress = pct.clamp(0.0, 1.0);
      _continueModule = selectedModule;
      _quizzesDone = attemptsCount;
    });
  }

  Future<void> _loadUserName() async {
    final authUser = FirebaseAuth.instance.currentUser;
    final uid = authUser?.uid;
    String name = authUser?.displayName ?? '';

    if (uid != null) {
      try {
        final doc = await _fs.getUserProfile(uid);
        final data = doc.data();
        if (data != null) {
          name = (data['name'] as String?) ?? (data['displayName'] as String?) ?? name;
          if (name.isEmpty && data['email'] is String) {
            name = (data['email'] as String).split('@').first;
          }
        }
      } catch (_) {}
    }

    if (name.isEmpty && authUser?.email != null) {
      name = authUser!.email!.split('@').first;
    }

    if (!mounted) return;
    setState(() {
      _displayName = name.isNotEmpty ? name : 'Explorer';
    });
  }

  Future<void> _loadHearts() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      setState(() => _hearts = 5);
      return;
    }

    try {
      final regen = await _fs.ensureHeartsUpdated(uid);
      if (!mounted) return;
      final int value = (regen ?? 5).clamp(0, 5);
      setState(() => _hearts = value);
    } catch (_) {
      if (!mounted) return;
      setState(() => _hearts = 5);
    }
  }

  Future<void> _loadLevel() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      Map<String, dynamic> stats = {};
      if (uid != null) {
        stats = await _fs.recalculateLearningStatsForUser(uid);
      }

      // fallback to local courses when firestore unavailable
      final totalModules = (stats['totalModules'] is int)
          ? stats['totalModules'] as int
          : _api.getCourses().fold<int>(0, (p, c) => p + c.modules.length);
      final modulesCompleted = (stats['modulesCompleted'] is int) ? stats['modulesCompleted'] as int : 0;

      // Compute a simple label based on fraction completed
      double frac = totalModules > 0 ? (modulesCompleted / totalModules) : 0.0;
      String label = 'Beginner';
      int tierLevel = 1; // 1 for Beginner, 2 for Intermediate, 3 for Advanced
      if (frac >= 0.66) {
        label = 'Advanced';
        tierLevel = 3;
      } else if (frac >= 0.33) {
        label = 'Intermediate';
        tierLevel = 2;
      }

      setState(() {
        _modulesCompleted = modulesCompleted;
        _totalModules = totalModules;
        _levelNumber = tierLevel; // Use tier level (1, 2, 3) instead of XP-based level
        _levelLabel = label;
        _moduleProgress = frac.clamp(0.0, 1.0);
        _lessonsDone = modulesCompleted;
        _totalProgressLabel = '${(frac * 100).clamp(0, 100).toStringAsFixed(0)}%';
      });
    } catch (e) {
      // keep defaults on error
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final basePadding = screenWidth * 0.05;
    final bottomInset = MediaQuery.of(context).padding.bottom;
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
            padding: EdgeInsets.fromLTRB(
              basePadding,
              basePadding,
              basePadding,
              basePadding + bottomInset + 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with notification
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, ${_displayName.isNotEmpty ? _displayName : 'Explorer'}! 👋',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: screenWidth * 0.07 > 28 ? 28 : screenWidth * 0.07,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Welcome back and good luck today! 🎯',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04 > 16 ? 16 : screenWidth * 0.04,
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Level + Hearts Card
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
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color.fromRGBO(52, 141, 188, 1), Color(0xFF5AB4D8)],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            '$_levelNumber',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Level',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                            ),
                            Text(
                              _levelLabel,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: LinearProgressIndicator(
                                      value: _moduleProgress,
                                      backgroundColor: Colors.grey.shade200,
                                      valueColor: const AlwaysStoppedAnimation<Color>(
                                        Color.fromRGBO(52, 141, 188, 1),
                                      ),
                                      minHeight: 8,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${(_moduleProgress * 100).clamp(0, 100).toStringAsFixed(0)}%',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '$_modulesCompleted / $_totalModules modules',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF888888),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Icon(
                              Icons.favorite,
                              color: index < _hearts ? Colors.red.shade400 : Colors.grey.shade300,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Animated Robot Mascot
                Center(
                  child: Container(
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
                    child: Row(
                      children: [
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 1500),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(0, -10 * (0.5 - (value - 0.5).abs()) * 4),
                              child: child,
                            );
                          },
                          onEnd: () {
                            // Restart animation
                            setState(() {});
                          },
                          child: Image.asset(
                            'assets/images/robot.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Keep Learning!',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Great progress, $_displayName! 🚀',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Streak Card
                // Continue Lesson Card
                Container(
                  padding: const EdgeInsets.all(24),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.play_circle_outline,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Continue Lesson',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _continueTitle,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: _continueProgress,
                          backgroundColor: Colors.white.withValues(alpha: 0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${(_continueProgress * 100).clamp(0, 100).toStringAsFixed(0)}% Complete',
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            final module = _continueModule;
                            if (module != null) {
                              Navigator.pushNamed(context, '/module', arguments: module);
                            } else {
                              Navigator.pushNamed(context, '/modules');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color.fromRGBO(
                              52,
                              141,
                              188,
                              1,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Resume Learning',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                        height: 110,
                        child: _buildStatCard(
                          _lessonsDone.toString(),
                          'Lessons\nDone',
                          const Color.fromRGBO(52, 141, 188, 1),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 110,
                        child: _buildStatCard(
                          _totalProgressLabel,
                          'Total Progress',
                          const Color(0xFF4CAF50),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 110,
                        child: _buildStatCard(
                          _quizzesDone.toString(),
                          'Quizzes',
                          const Color(0xFFFF6B9D),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, 0),
    );
  }

  Widget _buildStatCard(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF666666),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
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
            break; // Already on home
          case 1:
            Navigator.pushReplacement(context, SmoothPageRoute(page: ModulesScreen()));
            break;
          case 2:
            Navigator.pushReplacement(context, SmoothPageRoute(page: ProgressScreen()));
            break;
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
