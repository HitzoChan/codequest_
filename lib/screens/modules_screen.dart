import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../backend/firestore_service.dart';
import '../backend/quizzes.dart';
import '../backend/course_module_api.dart';
import '../backend/course_models.dart';
import 'module_detail_screen.dart';
import '../utils/page_transitions.dart';
import 'home_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';

class ModulesScreen extends StatefulWidget {
  const ModulesScreen({super.key});

  @override
  State<ModulesScreen> createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  final CourseModuleAPI courseModuleAPI = CourseModuleAPI();
  final FirestoreService _firestore = FirestoreService();

  // per-module quiz progress
  final Map<String, double> _quizProgress = {};
  final Map<String, int> _quizScore = {};
  final Set<String> _quizPassed = {};

  List<Course> courses = [];
  List<Course> filteredCourses = [];
  String searchKeyword = '';
  String selectedLevel = 'All Levels';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    courses = courseModuleAPI.getCourses();
    filteredCourses = List.from(courses);
    _initCourses();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _initCourses() async {
    try {
      // Don't clear courses, keep showing the cached ones
      await courseModuleAPI.initialize();
      final fetched = await courseModuleAPI.fetchCourses();

      if (fetched.isNotEmpty) {
        setState(() {
          courses = fetched;
          filteredCourses = List.from(courses);
        });
      }

      _loadQuizProgress();
    } catch (e) {
      // Keep existing courses if fetch fails
    }
  }

  Future<void> _loadQuizProgress() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) { return; }
      final attempts = await _firestore.fetchQuizAttemptsForUser(uid);

      // Track the most recent attempt per quizId using attemptedAt timestamp
      final Map<String, DateTime> latestAttemptAt = {};
      final Map<String, int> latestScore = {};
      final Set<String> latestPassed = {};

      for (final a in attempts) {
        final quizId = a['quizId'] as String?;
        if (quizId == null) { continue; }

        final scoreVal = a['score'];
        final passed = a['passed'] as bool? ?? false;

        // Map old module IDs to new consolidated IDs
        String normalizedQuizId = quizId;
        if (quizId == 'sql_intro_01' || quizId == 'computing_intro_01' || quizId == 'programming_fundamentals_01' || quizId == 'programming_fundamentals_beginner_01' || quizId == 'intro_to_web_dev_01' || quizId == 'intro_to_python_01' || quizId == 'web_dev_ch1_pdf') {
          normalizedQuizId = 'programming_beginner_ch1';
        }
        if (quizId == 'web_development_01' || quizId == 'python_intermediate_01' || quizId == 'web_dev_intermediate_ch1') {
          normalizedQuizId = 'programming_intermediate_ch1';
        }
        if (quizId == 'data_structures_advanced_01' || quizId == 'python_advanced_01') {
          normalizedQuizId = 'programming_advanced_ch1';
        }

        // parse attemptedAt robustly (Timestamp, DateTime, int millis)
        DateTime? attemptedAt;
        final attemptedRaw = a['attemptedAt'];
        try {
          if (attemptedRaw is DateTime) { attemptedAt = attemptedRaw; }
          else if (attemptedRaw != null) {
            // Some Firestore clients return a Timestamp-like object with toDate()
            try {
              attemptedAt = (attemptedRaw as dynamic).toDate() as DateTime;
            } catch (_) {
              if (attemptedRaw is int) { attemptedAt = DateTime.fromMillisecondsSinceEpoch(attemptedRaw); }
              else if (attemptedRaw is String) { attemptedAt = DateTime.tryParse(attemptedRaw); }
            }
          }
        } catch (_) {
          attemptedAt = null;
        }

        int scoreInt = scoreVal is int ? scoreVal : 0;

        // If we don't have a recorded time for this quiz, or this attempt is newer, update
        final existing = latestAttemptAt[normalizedQuizId];
        final shouldReplace = existing == null || (attemptedAt != null && attemptedAt.isAfter(existing));

        if (shouldReplace) {
          if (attemptedAt != null) { latestAttemptAt[normalizedQuizId] = attemptedAt; }
          latestScore[normalizedQuizId] = scoreInt;
          if (passed) { latestPassed.add(normalizedQuizId); } else { latestPassed.remove(normalizedQuizId); }
        }
      }

      // Build progress map from latestScore/latestPassed
      final Map<String, double> map = {};
      latestScore.forEach((quizId, scoreInt) {
        int total = 0;
        if (quizId == 'programming_beginner_ch1') { total = BeginnerProgrammingQuiz.questions.length; }
        else if (quizId == 'programming_intermediate_ch1') { total = IntermediateProgrammingQuiz.questions.length; }
        else if (quizId == 'programming_advanced_ch1') { total = AdvancedProgrammingQuiz.questions.length; }

        // Clamp score to not exceed the total questions
        final clampedScore = scoreInt.clamp(0, total);
        final passed = latestPassed.contains(quizId);
        if (passed) { map[quizId] = 1.0; }
        else { map[quizId] = total > 0 ? (clampedScore / total).clamp(0.0, 1.0) : 0.0; }
      });

      setState(() {
        _quizProgress.clear();
        _quizProgress.addAll(map);
        _quizScore.clear();
        // Store clamped scores
        latestScore.forEach((quizId, scoreInt) {
          int total = 0;
          if (quizId == 'programming_beginner_ch1') { total = BeginnerProgrammingQuiz.questions.length; }
          else if (quizId == 'programming_intermediate_ch1') { total = IntermediateProgrammingQuiz.questions.length; }
          else if (quizId == 'programming_advanced_ch1') { total = AdvancedProgrammingQuiz.questions.length; }
          _quizScore[quizId] = scoreInt.clamp(0, total);
        });
        _quizPassed.clear();
        _quizPassed.addAll(latestPassed);
      });
    } catch (_) {}
  }

  void filterCourses() {
    setState(() {
      final term = searchKeyword.toLowerCase().trim();

      filteredCourses = courses.map((course) {
        final matchingModules = course.modules.where((module) {
          // Check if search term matches title (exact or beginning match)
          final moduleTitle = module.title.toLowerCase();
          final courseTitle = course.title.toLowerCase();
          final courseDesc = course.description.toLowerCase();
          
          final matchSearch = term.isEmpty ||
              moduleTitle.contains(term) ||
              courseTitle.contains(term) ||
              courseDesc.contains(term);

          final matchLevel = selectedLevel == 'All Levels' ||
              module.difficultyLevel.toLowerCase() ==
                  selectedLevel.toLowerCase();

          return matchSearch && matchLevel;
        }).toList();

        return Course(
          courseId: course.courseId,
          title: course.title,
          description: course.description,
          modules: matchingModules,
          difficultyLevel: course.difficultyLevel,
        );
      }).where((c) => c.modules.isNotEmpty).toList();
    });
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = selectedLevel == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLevel = label;
          searchKeyword = '';
          _searchController.clear();
          filterCourses();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(52, 141, 188, 1)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromRGBO(52, 141, 188, 1),
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : const Color.fromRGBO(52, 141, 188, 1),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  // MODULE CARD (WITH PILL PROGRESS INDICATOR)
  // ---------------------------------------------------------
  Widget _buildModuleCard(Module module) {
    Color levelColor = _getLevelColor(module.difficultyLevel);
    // Ensure we always have a visible difficulty label
    final String difficultyLabel = module.difficultyLevel.trim().isEmpty ? 'Level' : module.difficultyLevel;

    // Compute quiz progress
    int total = 0;
    if (module.moduleId == 'programming_beginner_ch1') {
      total = BeginnerProgrammingQuiz.questions.length;
    } else if (module.moduleId == 'programming_intermediate_ch1') {
      total = IntermediateProgrammingQuiz.questions.length;
    } else if (module.moduleId == 'programming_advanced_ch1') {
      total = AdvancedProgrammingQuiz.questions.length;
    }

    final int score = (_quizScore[module.moduleId] ?? 0).clamp(0, total);
    final bool passed = _quizPassed.contains(module.moduleId);
    final double pct = total > 0 ? (score / total).clamp(0.0, 1.0) : 0.0;
    final Color progressColor = passed || pct == 1.0 ? Colors.green : levelColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModuleDetailScreen(module: module),
            ),
          );
          // Refresh quiz progress after returning from details/quiz so latest attempts show
          await _loadQuizProgress();
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 26),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              Text(
                module.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),

              const SizedBox(height: 16),

              // DIFFICULTY CHIP + PROGRESS PILL (ROW)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Difficulty chip
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      color: levelColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      difficultyLabel,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // PROGRESS PILL
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        // Background pill
                        Container(
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 76),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),

                        // Progress fill
                        FractionallySizedBox(
                          widthFactor: pct,
                          child: Container(
                            height: 28,
                            decoration: BoxDecoration(
                              color: progressColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),

                        // Text inside pill
                        Positioned.fill(
                          child: Center(
                            child: Text(
                              total == 0 ? "- / -" : "$score / $total",
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'beginner':
        return const Color(0xFF4CAF50);
      case 'intermediate':
        return const Color(0xFF3585B5);
      case 'advanced':
        return const Color(0xFF9C27B0);
      default:
        return Colors.grey;
    }
  }
  // ---------------------------------------------------------
  // MAIN UI
  // ---------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A3A52),
              Color(0xFF0D1F2D),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              
              // -------------------------
              // HEADER
              // -------------------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF7EC8E3),
                      Color(0xFF5AB4D8),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Modules',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Computer Programming',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // -------------------------
                    // SEARCH BAR
                    // -------------------------
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Color.fromRGBO(52, 141, 188, 1),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              onChanged: (value) {
                                setState(() {
                                  searchKeyword = value;
                                  filterCourses();
                                });
                              },
                              style: const TextStyle(
                                color: Color.fromRGBO(52, 141, 188, 1),
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Search modules...',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(52, 141, 188, 0.7),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          
                          // Clear button
                          if (searchKeyword.isNotEmpty)
                            IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: Color.fromRGBO(52, 141, 188, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  searchKeyword = '';
                                  _searchController.clear();
                                  filterCourses();
                                });
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // -------------------------
              // FILTER CHIPS
              // -------------------------
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  clipBehavior: Clip.none,
                  child: Row(
                    children: [
                      _buildFilterChip('All Levels'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Beginner'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Intermediate'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Advanced'),
                    ],
                  ),
                ),
              ),

              // -------------------------
              // MODULE LIST
              // -------------------------
              Expanded(
                child: filteredCourses.isEmpty
                    ? Center(
                        child: Text(
                          "No modules found.",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 217),
                            fontSize: 16,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${filteredCourses.fold<int>(0, (p, c) => p + c.modules.length)} module(s) found',
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),

                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              itemCount: filteredCourses.length,
                              itemBuilder: (context, index) {
                                final course = filteredCourses[index];
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 247, 244, 244),
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    ...course.modules.map(_buildModuleCard),

                                    const SizedBox(height: 16),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: _buildBottomNavBar(context, 1),
    );
  }

  // ---------------------------------------------------------
  // BOTTOM NAV BAR
  // ---------------------------------------------------------
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
    bool isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () {
        if (isSelected) return; // Don't navigate if already on current screen
        switch (index) {
          case 0:
            Navigator.pushReplacement(context, SmoothPageRoute(page: HomeScreen()));
            break;
          case 1:
            break; // Already on modules
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
