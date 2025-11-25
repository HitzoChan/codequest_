import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Removed unused variables chartHeight and barWidth (were not referenced).

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
                  padding: EdgeInsets.all(
                    screenWidth * 0.06 > 20 ? 20 : screenWidth * 0.06,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF7EC8E3), Color(0xFF5AB4D8)],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
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
                SizedBox(
                  height: screenWidth * 0.05 > 20 ? 20 : screenWidth * 0.05,
                ),

                // Level and XP Cards
                Row(
                  children: [
                    Expanded(
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
                              '12',
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
                              '2.4k',
                              style: TextStyle(
                                fontSize: screenWidth * 0.07 > 28
                                    ? 28
                                    : screenWidth * 0.07,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF4CAF50),
                              ),
                            ),
                            Text(
                              'Total XP',
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

                // Weekly XP Chart
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
                        'Weekly XP',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: 600,
                            barTouchData: BarTouchData(enabled: false),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    const days = [
                                      'Mon',
                                      'Tue',
                                      'Wed',
                                      'Thu',
                                      'Fri',
                                      'Sat',
                                      'Sun',
                                    ];
                                    return Text(
                                      days[value.toInt()],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF666666),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 40,
                                  getTitlesWidget: (value, meta) {
                                    return Text(
                                      value.toInt().toString(),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF666666),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            gridData: FlGridData(
                              show: true,
                              drawVerticalLine: false,
                              horizontalInterval: 150,
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                  color: Colors.grey.shade200,
                                  strokeWidth: 1,
                                );
                              },
                            ),
                            borderData: FlBorderData(show: false),
                            barGroups: [
                              _buildBarGroup(0, 400),
                              _buildBarGroup(1, 450),
                              _buildBarGroup(2, 500),
                              _buildBarGroup(3, 520),
                              _buildBarGroup(4, 480),
                              _buildBarGroup(5, 550),
                              _buildBarGroup(6, 580),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Total this week: 2,100 XP',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

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
                            '24%',
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
                        2,
                        2,
                        const Color(0xFF4CAF50),
                      ),
                      const SizedBox(height: 16),
                      _buildModuleProgress(
                        'Intermediate',
                        1,
                        3,
                        const Color.fromRGBO(52, 141, 188, 1),
                      ),
                      const SizedBox(height: 16),
                      _buildModuleProgress('Advanced', 0, 3, Colors.grey),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Stats Row
                Row(
                  children: [
                    Expanded(
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
                        child: const Column(
                          children: [
                            Icon(
                              Icons.local_fire_department,
                              color: Colors.white,
                              size: 32,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '7',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Day Streak',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
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
                        child: const Column(
                          children: [
                            Icon(
                              Icons.quiz_outlined,
                              color: Colors.white,
                              size: 32,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '18',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Quizzes Passed',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Achievements
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
                            'Achievements',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          Text(
                            '4/6 Unlocked',
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromRGBO(52, 141, 188, 1),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: [
                          _buildAchievement('🎯', 'First Steps', true),
                          _buildAchievement('🏆', 'Quiz Master', true),
                          _buildAchievement('🔥', 'Week Warrior', true),
                          _buildAchievement('⭐', 'XP Hunter', true),
                          _buildAchievement('💯', 'Perfect Score', false),
                          _buildAchievement('⚡', 'Speed Learner', false),
                        ],
                      ),
                    ],
                  ),
                ),
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
                      _buildActivityItem(
                        Icons.check_circle,
                        const Color(0xFF4CAF50),
                        'Completed Quiz',
                        'React Native Fundamentals',
                        'Today',
                      ),
                      const SizedBox(height: 12),
                      _buildActivityItem(
                        Icons.emoji_events,
                        const Color.fromRGBO(52, 141, 188, 1),
                        'Earned 250 XP',
                        'Module completion',
                        'Today',
                      ),
                      const SizedBox(height: 12),
                      _buildActivityItem(
                        Icons.local_fire_department,
                        const Color(0xFFFF6B9D),
                        '7-Day Streak',
                        'Keep going!',
                        'Today',
                      ),
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

  BarChartGroupData _buildBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: const LinearGradient(
            colors: [Color.fromRGBO(52, 141, 188, 1), Color(0xFF5AB4D8)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          width: 20,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
        ),
      ],
    );
  }

  Widget _buildModuleProgress(
    String level,
    int completed,
    int total,
    Color color,
  ) {
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
            value: completed / total,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildAchievement(String emoji, String title, bool unlocked) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: unlocked
            ? const Color.fromRGBO(52, 141, 188, 0.1)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: TextStyle(
              fontSize: 32,
              color: unlocked ? null : Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: unlocked ? const Color(0xFF1A1A1A) : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }

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
