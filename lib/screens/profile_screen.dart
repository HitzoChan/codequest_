import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  // Local UI toggles (not persisted here)
  bool _notifications = true;
  bool _soundEffects = true;
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    if (user != null) {
      _loadUserData(user!.uid);
    } else {
      setState(() => _loading = false);
    }
  }

  Future<void> _loadUserData(String userId) async {
    try {
      final userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        setState(() {
          userData = userDoc.data();
          _loading = false;
        });
      } else {
        setState(() {
          userData = null;
          _loading = false;
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print("Failed to load user data: $e");
      setState(() {
        userData = null;
        _loading = false;
      });
    }
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

    // XP - some DBs might use totalXP or xp
    final int xp = (userData?['xp'] is int)
        ? userData!['xp'] as int
        : (userData?['totalXP'] is int ? userData!['totalXP'] as int : 0);

    final int level = (userData?['level'] as int?) ?? 1;
    final int streak = (userData?['streak'] as int?) ??
        (userData?['current_streak'] as int?) ??
        0;

    // hearts and badges with safe defaults
    final int hearts = (userData?['hearts'] as int?) ?? 5;
    final int badges =
        (userData?['badges'] as int?) ?? (userData?['achievements_count'] as int?) ?? 0;

    // Learning stats
    final int modulesCompleted =
        (userData?['modulesCompleted'] as int?) ?? (userData?['modules_completed'] as int?) ?? 0;
    final int totalModules =
        (userData?['totalModules'] as int?) ?? (userData?['total_modules'] as int?) ?? 8;
    final int quizzesPassed = (userData?['quizzesPassed'] as int?) ?? 0;
    final String avgScore = (userData?['averageScore'] != null) ? "${userData!['averageScore']}" : '—';
    final String studyTime = (userData?['studyTime'] as String?) ?? '0h 0m';

    // Current subject
    final String currentSubject = (userData?['currentSubject'] as String?) ??
        (userData?['subject'] as String?) ??
        'Mobile App Development';
    final String currentSubjectDate = (userData?['currentSubjectDate'] as String?) ??
        (userData?['subject_started_at'] as String?) ??
        '';

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
                        // settings icon
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              // place for settings action
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: screenWidth * 0.06 > 24 ? 24 : screenWidth * 0.06,
                              ),
                            ),
                          ),
                        ),

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

                        // Level badge + hearts
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.04 > 16 ? 16 : screenWidth * 0.04,
                                vertical: screenWidth * 0.02 > 8 ? 8 : screenWidth * 0.02,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Level $level',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035 > 14 ? 14 : screenWidth * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            SizedBox(width: screenWidth * 0.03),

                            Row(
                              children: List.generate(
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
                            child: _buildStatCard(
                              Icons.emoji_events_outlined,
                              xp.toString(),
                              'Total XP',
                              const Color.fromRGBO(52, 141, 188, 1),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildStatCard(
                              Icons.military_tech_outlined,
                              badges.toString(),
                              'Badges',
                              const Color(0xFF4CAF50),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildStatCard(
                              Icons.local_fire_department,
                              streak.toString(),
                              'Day Streak',
                              const Color(0xFFFF6B9D),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Edit profile card
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
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(52, 141, 188, 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Color.fromRGBO(52, 141, 188, 1),
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Update your information',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Color(0xFF666666),
                            ),
                          ],
                        ),
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
                            const Text(
                              'Learning Stats',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildStatRow('Modules Completed', '$modulesCompleted/$totalModules', totalModules > 0 ? (modulesCompleted / totalModules) : 0.0),
                            const SizedBox(height: 16),
                            _buildStatRow('Quizzes Passed', quizzesPassed.toString(), null),
                            const SizedBox(height: 16),
                            _buildStatRow('Average Score', avgScore, null),
                            const SizedBox(height: 16),
                            _buildStatRow('Study Time', studyTime, null),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Current Subject card
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
                              'Current Subject',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentSubject,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        currentSubjectDate.isNotEmpty ? currentSubjectDate : 'Enrolled on —',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF666666),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(52, 141, 188, 0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.phone_android,
                                    color: Color.fromRGBO(52, 141, 188, 1),
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Settings toggles (local UI only)
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
                          children: [
                            _buildSettingToggle('Notifications', _notifications, (v) => setState(() => _notifications = v)),
                            const Divider(height: 32),
                            _buildSettingToggle('Sound Effects', _soundEffects, (v) => setState(() => _soundEffects = v)),
                            const Divider(height: 32),
                            _buildSettingToggle('Dark Mode', _darkMode, (v) => setState(() => _darkMode = v)),
                          ],
                        ),
                      ),

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

  Widget _buildSettingToggle(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A))),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: const Color.fromRGBO(52, 141, 188, 1),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar(BuildContext context, int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, -2)),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex) {
    final isSelected = index == currentIndex;
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
          Icon(icon, color: isSelected ? const Color.fromRGBO(52, 141, 188, 1) : Colors.grey.shade400, size: 28),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: isSelected ? const Color.fromRGBO(52, 141, 188, 1) : Colors.grey.shade400, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
