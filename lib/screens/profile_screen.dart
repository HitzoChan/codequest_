import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../utils/page_transitions.dart';
import 'home_screen.dart';
import 'modules_screen.dart';
import 'progress_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? user;
  Map<String, dynamic>? userData;
  bool _loading = true;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _userSub;

  // (module XP UI removed per request)

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    if (user != null) {
      // listen to user document so UI updates immediately when XP changes
      _userSub = _firestore.collection('users').doc(user!.uid).snapshots().listen((doc) {
        if (doc.exists && doc.data() != null) {
          setState(() {
            userData = doc.data();
            _loading = false;
          });
        } else {
          setState(() {
            userData = null;
            _loading = false;
          });
        }
      }, onError: (e) {
        // ignore: avoid_print
        debugPrint('User snapshot error: $e');
        setState(() {
          userData = null;
          _loading = false;
        });
      });
    } else {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _userSub?.cancel();
    super.dispose();
  }

  

  Future<void> _handleLogout() async {
    try {
      await _auth.signOut();
    } catch (_) {}
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (userData == null) {
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
            child: Center(
              child: Text(
                'No user data found.',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      );
    }

    // Read DB fields with safe fallbacks
    final String name = (userData?['name'] as String?) ?? 'User';
    final String email = (userData?['email'] as String?) ?? 'No email';

    // Make avatarUrl non-nullable string (empty string = no avatar)
    final String avatarUrl = (userData?['avatarUrl'] as String?) ?? '';

    // Learning stats
    final int modulesCompleted =
        (userData?['modulesCompleted'] as int?) ?? (userData?['modules_completed'] as int?) ?? 0;
    final int totalModules =
        (userData?['totalModules'] as int?) ?? (userData?['total_modules'] as int?) ?? 8;
    final int quizzesPassed = (userData?['quizzesPassed'] as int?) ?? 0;
    final String avgScore = (userData?['averageScore'] != null) ? "${userData!['averageScore']}" : '—';

    // hearts with safe defaults
    final int hearts = (userData?['hearts'] as int?) ?? 5;

    // clamp hearts to [0,5] and convert to int
    final int heartsToShow = hearts.clamp(0, 5).toInt();

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
            child: Column(
              children: [
                // Gradient header
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF7EC8E3), Color(0xFF5AB4D8)],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.06),
                    child: Column(
                      children: [
                        SizedBox(height: screenWidth * 0.04),

                        // avatar (if avatarUrl not empty show network image)
                        Container(
                          width: screenWidth * 0.25 > 100 ? 100 : screenWidth * 0.25,
                          height: screenWidth * 0.25 > 100 ? 100 : screenWidth * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            image: avatarUrl.isNotEmpty ? DecorationImage(
                              image: NetworkImage(avatarUrl),
                              fit: BoxFit.cover,
                            ) : null,
                          ),
                          child: avatarUrl.isEmpty
                              ? Icon(
                                  Icons.person,
                                  size: screenWidth * 0.125 > 50 ? 50 : screenWidth * 0.125,
                                  color: const Color.fromRGBO(52, 141, 188, 1),
                                )
                              : null,
                        ),

                        SizedBox(height: screenWidth * 0.04),

                        // name
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: screenWidth * 0.06 > 24 ? 24 : screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: screenWidth * 0.015),

                        // email
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035 > 14 ? 14 : screenWidth * 0.035,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),

                        SizedBox(height: screenWidth * 0.04),

                        // Hearts only
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Hearts (display only)
                            Row(
                              children: [
                                ...List.generate(
                                  heartsToShow,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(left: screenWidth * 0.005 > 2 ? 2 : screenWidth * 0.005),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red.shade400,
                                      size: screenWidth * 0.05 > 20 ? 20 : screenWidth * 0.05,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Stats row & cards
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: null,
                              child: _buildStatCard(
                                Icons.book_outlined,
                                '$modulesCompleted',
                                'Modules',
                                const Color(0xFF4CAF50),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: null,
                              child: _buildStatCard(
                                Icons.check_circle_outline,
                                quizzesPassed.toString(),
                                'Quizzes',
                                const Color(0xFFFF6B9D),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Learning Stats card
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
                                  'Learning Stats',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1A1A1A),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _recalculateLearningStats,
                                  icon: const Icon(Icons.refresh, color: Color(0xFF666666)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            _buildStatRow('Modules Completed', '$modulesCompleted/$totalModules', totalModules > 0 ? (modulesCompleted / totalModules) : 0.0),
                            const SizedBox(height: 16),
                            _buildStatRow('Quizzes Passed', quizzesPassed.toString(), null),
                            const SizedBox(height: 16),
                            _buildStatRow('Average Score', avgScore, null),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      const SizedBox(height: 20),

                      // Logout big card
                      GestureDetector(
                        onTap: _handleLogout,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, color: Colors.red.shade400, size: 20),
                              const SizedBox(width: 8),
                              Text('Log Out', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red.shade400)),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, 3),
    );
  }

  /// Recalculate simple learning stats by querying Firestore and store back to user doc.
  Future<void> _recalculateLearningStats() async {
    if (user == null) return;
    try {
      // modules completed: count user_progress documents with completed == true
      final upQuery = await _firestore.collection('user_progress').where('userId', isEqualTo: user!.uid).get();
      int modulesCompleted = 0;
      int totalStudyMinutes = 0;
      for (final doc in upQuery.docs) {
        final data = doc.data();
        // user_progress previously used a boolean 'completed' field in older seeds,
        // newer code uses a 'status' string (e.g. 'completed'). Accept both.
        final bool isCompleted = (data['completed'] == true) || ((data['status'] as String?) == 'completed');
        if (isCompleted) {
          modulesCompleted++;
        }
        if (data['timeSpentMinutes'] is int) {
          totalStudyMinutes += data['timeSpentMinutes'] as int;
        }
      }

      // total modules: sum of modules arrays on courses
      final courses = await _firestore.collection('courses').get();
      int totalModules = 0;
      for (final c in courses.docs) {
        final m = c.data()['modules'];
        if (m is List) totalModules += m.length;
      }
      if (totalModules == 0) totalModules = 8; // fallback

      // quizzes passed and average score
      final qa = await _firestore.collection('quiz_attempts').where('userId', isEqualTo: user!.uid).get();
      int quizzesPassed = 0;
      double scoreSum = 0.0;
      int scoreCount = 0;
      final passedQuizIds = <String>{};
      
      debugPrint('=== Processing ${qa.docs.length} quiz attempts ===');
      
      for (final q in qa.docs) {
        final data = q.data();
        if (data['passed'] == true && data['quizId'] is String) passedQuizIds.add(data['quizId'] as String);
        
        // Calculate percentage score: score is number of correct answers
        final score = data['score'];
        final answers = data['answers'];
        
        debugPrint('Quiz attempt: score=$score, answers=${answers is List ? answers.length : 'null'}');
        
        if (score is int && answers is List && answers.isNotEmpty) {
          final correctAnswers = score;
          final totalQuestions = answers.length;
          final percentage = (correctAnswers / totalQuestions) * 100;
          
          debugPrint('  -> Calculated: $correctAnswers/$totalQuestions = ${percentage.toStringAsFixed(1)}%');
          
          scoreSum += percentage;
          scoreCount++;
        }
      }
      
      debugPrint('Total: scoreSum=$scoreSum, scoreCount=$scoreCount');
      
      quizzesPassed = passedQuizIds.length;
      final avgScore = scoreCount > 0 ? '${(scoreSum / scoreCount).round()}%' : '—';

      // update user doc
      await _firestore.collection('users').doc(user!.uid).update({
        'modulesCompleted': modulesCompleted,
        'totalModules': totalModules,
        'quizzesPassed': quizzesPassed,
        'averageScore': avgScore,
        'studyTime': '${(totalStudyMinutes / 60).floor()}h ${(totalStudyMinutes % 60)}m',
      });
      if (mounted) {
        setState(() {
          userData = {...?userData, 'modulesCompleted': modulesCompleted, 'totalModules': totalModules, 'quizzesPassed': quizzesPassed, 'averageScore': avgScore, 'studyTime': '${(totalStudyMinutes / 60).floor()}h ${(totalStudyMinutes % 60)}m'};
        });
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Learning stats updated')));
    } catch (e) {
      // ignore: avoid_print
      debugPrint('Failed to recalc learning stats: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to update learning stats')));
    }
  }

  // Module XP loader removed.

  // Small stat card used in the header row (XP, Badges, Streak)
  Widget _buildStatCard(IconData icon, String value, String label, Color color) {
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
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: Color(0xFF666666))),
        ],
      ),
    );
  }

  

  Widget _buildStatRow(String label, String value, double? progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 14, color: Color(0xFF666666))),
            Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: progress != null ? const Color.fromRGBO(52, 141, 188, 1) : const Color(0xFF1A1A1A))),
          ],
        ),
        if (progress != null) ...[
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(Color.fromRGBO(52, 141, 188, 1)),
              minHeight: 6,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildBottomNavBar(BuildContext context, int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(30, 30, 30, 1),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 20),
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

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex) {
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
            Navigator.pushReplacement(context, SmoothPageRoute(page: ProgressScreen()));
            break;
          case 3:
            break; // Already on profile
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromRGBO(52, 141, 188, 0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color.fromRGBO(52, 141, 188, 1) : Colors.grey.shade500,
              size: 26,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? const Color.fromRGBO(52, 141, 188, 1) : Colors.grey.shade500,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
