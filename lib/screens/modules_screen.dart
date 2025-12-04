import 'package:flutter/material.dart';
import '../backend/course_module_api.dart';
import '../backend/course_module_management.dart';
import 'module_detail_screen.dart';

class ModulesScreen extends StatefulWidget {
  const ModulesScreen({super.key});

  @override
  State<ModulesScreen> createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  final CourseModuleAPI courseModuleAPI = CourseModuleAPI();

  List<Course> courses = [];
  List<Course> filteredCourses = [];
  String searchKeyword = '';
  String selectedLevel = 'All Levels';

  @override
  void initState() {
    super.initState();
    // Start with the local cached courses so UI shows modules immediately
    courses = courseModuleAPI.getCourses();
    filteredCourses = List.from(courses);
    // Initialize backend and fetch courses (may come from Firestore) and refresh UI afterwards
    _initCourses();
  }

  Future<void> _initCourses() async {
    try {
      // show the placeholder while fetching
      setState(() => filteredCourses = []);
      await courseModuleAPI.initialize();
      final fetched = await courseModuleAPI.fetchCourses();
      
      // Debug: Print pdfUrl for SQL module
      for (var course in fetched) {
        for (var module in course.modules) {
          if (module.moduleId == 'sql_intro_01') {
            print('DEBUG: SQL Module pdfUrl from Firestore: ${module.pdfUrl}');
          }
        }
      }
      
      setState(() {
        courses = fetched.isNotEmpty ? fetched : courseModuleAPI.getCourses();
        filteredCourses = List.from(courses);
      });
    } catch (e) {
      // If remote fetch fails, fall back to the local seeded courses
      setState(() {
        courses = courseModuleAPI.getCourses();
        filteredCourses = List.from(courses);
      });
      // ignore: avoid_print
      print('Failed to fetch courses: $e');
    }
  }

  void filterCourses() {
    setState(() {
      filteredCourses = courses.where((course) {
        final term = searchKeyword.toLowerCase();
        bool matchesSearch =
            course.title.toLowerCase().contains(term) ||
            course.description.toLowerCase().contains(term);

        bool matchesLevel =
            selectedLevel == 'All Levels' ||
            course.difficultyLevel.toLowerCase() ==
                selectedLevel.toLowerCase();

        return matchesSearch && matchesLevel;
      }).toList();
    });
  }

  // -----------------------------
  // FILTER CHIP
  // -----------------------------
  Widget _buildFilterChip(String label) {
    bool isSelected = selectedLevel == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLevel = label;
          filterCourses();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(52, 141, 188, 1)
              : const Color.fromRGBO(255, 255, 255, 1),
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

  // -----------------------------
  // MODULE CARD
  // -----------------------------
  Widget _buildModuleCard(Module module) {
    Color levelColor = _getLevelColor(module.difficultyLevel);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          // Navigate to Module Detail and pass the Module object
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModuleDetailScreen(module: module),
            ),
          );
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
          // Title Row
          Row(
            children: [
              Expanded(
                child: Text(
                  module.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFF666666)),
            ],
          ),

          const SizedBox(height: 12),

          // Difficulty + XP
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: levelColor.withValues(alpha: 40),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  module.difficultyLevel,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: levelColor,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              const Icon(Icons.stars, size: 16, color: Colors.amber),
              const SizedBox(width: 4),

              const Text(
                "+200 XP",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
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

  // -----------------------------
  // MAIN UI
  // -----------------------------
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
                    colors: [Color(0xFF7EC8E3), Color(0xFF5AB4D8)],
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
                      'Mobile App Development',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 230),
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
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
                            color: Colors.white.withValues(alpha: 220),
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: filteredCourses.length,
                        itemBuilder: (context, index) {
                          final course = filteredCourses[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
      ),

      bottomNavigationBar: _buildBottomNavBar(context, 1),
    );
  }

  // -------------------------
  // BOTTOM NAV BAR
  // -------------------------
  Widget _buildBottomNavBar(BuildContext context, int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 26),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Icons.home, 'Home', 0, currentIndex),
            _buildNavItem(context, Icons.book_outlined, 'Modules', 1, currentIndex),
            _buildNavItem(context, Icons.trending_up, 'Progress', 2, currentIndex),
            _buildNavItem(context, Icons.person_outline, 'Profile', 3, currentIndex),
          ],
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
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/modules');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/progress');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? const Color.fromRGBO(52, 141, 188, 1)
                : Colors.grey.shade400,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? const Color.fromRGBO(52, 141, 188, 1)
                  : Colors.grey.shade400,
              fontWeight:
                  isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
