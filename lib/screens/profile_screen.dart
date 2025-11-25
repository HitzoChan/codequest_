import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                // Profile Header with Gradient
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
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width * 0.06,
                    ),
                    child: Builder(
                      builder: (context) {
                        final screenWidth = MediaQuery.of(context).size.width;
                        return Column(
                          children: [
                            // Settings Icon
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: screenWidth * 0.06 > 24
                                      ? 24
                                      : screenWidth * 0.06,
                                ),
                              ),
                            ),
                            SizedBox(height: screenWidth * 0.04),

                            // Profile Avatar
                            Container(
                              width: screenWidth * 0.25 > 100
                                  ? 100
                                  : screenWidth * 0.25,
                              height: screenWidth * 0.25 > 100
                                  ? 100
                                  : screenWidth * 0.25,
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
                              ),
                              child: Icon(
                                Icons.person,
                                size: screenWidth * 0.125 > 50
                                    ? 50
                                    : screenWidth * 0.125,
                                color: const Color.fromRGBO(52, 141, 188, 1),
                              ),
                            ),
                            SizedBox(height: screenWidth * 0.04),

                            // User Name
                            Text(
                              'Alex Johnson',
                              style: TextStyle(
                                fontSize: screenWidth * 0.06 > 24
                                    ? 24
                                    : screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: screenWidth * 0.015),

                            // Email
                            Text(
                              'alex.johnson@email.com',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035 > 14
                                    ? 14
                                    : screenWidth * 0.035,
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                            SizedBox(height: screenWidth * 0.04),

                            // Level and Hearts
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.04 > 16
                                        ? 16
                                        : screenWidth * 0.04,
                                    vertical: screenWidth * 0.02 > 8
                                        ? 8
                                        : screenWidth * 0.02,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Level 12',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035 > 14
                                          ? 14
                                          : screenWidth * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                Row(
                                  children: List.generate(
                                    5,
                                    (index) => Padding(
                                      padding: EdgeInsets.only(
                                        left: screenWidth * 0.005 > 2
                                            ? 2
                                            : screenWidth * 0.005,
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red.shade400,
                                        size: screenWidth * 0.05 > 20
                                            ? 20
                                            : screenWidth * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                // Stats Cards
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildStatCard(
                              Icons.emoji_events_outlined,
                              '2.4k',
                              'Total XP',
                              const Color.fromRGBO(52, 141, 188, 1),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildStatCard(
                              Icons.military_tech_outlined,
                              '4',
                              'Badges',
                              const Color(0xFF4CAF50),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildStatCard(
                              Icons.local_fire_department,
                              '7',
                              'Day Streak',
                              const Color(0xFFFF6B9D),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Edit Profile Card
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

                      // Learning Stats Card
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
                            _buildStatRow('Modules Completed', '3/8', 0.375),
                            const SizedBox(height: 16),
                            _buildStatRow('Quizzes Passed', '18', null),
                            const SizedBox(height: 16),
                            _buildStatRow('Average Score', '87%', null),
                            const SizedBox(height: 16),
                            _buildStatRow('Study Time', '12h 34m', null),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Current Subject Card
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
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mobile App Development',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Enrolled on Nov 16, 2025',
                                        style: TextStyle(
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
                                    color: const Color.fromRGBO(
                                      52,
                                      141,
                                      188,
                                      0.1,
                                    ),
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

                      // Settings Toggles
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
                            _buildSettingToggle('Notifications', true),
                            const Divider(height: 32),
                            _buildSettingToggle('Sound Effects', true),
                            const Divider(height: 32),
                            _buildSettingToggle('Dark Mode', false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Logout Button
                      GestureDetector(
                        onTap: () {
                          // Stub: Clear session and navigate to login
                          // TODO: Add real session/user clearing logic
                          // Example: await UserSession.instance.logout();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Logged out.')),
                          );
                          Navigator.pushReplacementNamed(context, '/login');
                        },
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
                              Icon(
                                Icons.logout,
                                color: Colors.red.shade400,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Log Out',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade400,
                                ),
                              ),
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

  Widget _buildStatCard(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
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
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
          ),
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
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: progress != null
                    ? const Color.fromRGBO(52, 141, 188, 1)
                    : const Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
        if (progress != null) ...[
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color.fromRGBO(52, 141, 188, 1),
              ),
              minHeight: 6,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSettingToggle(String label, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1A1A1A),
          ),
        ),
        Switch(
          value: value,
          onChanged: (newValue) {},
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
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
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
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
