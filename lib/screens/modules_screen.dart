import 'package:flutter/material.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

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
              // Header
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
                      'Mobile App Development',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Search Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Search modules...',
                                hintStyle: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.7),
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Filter Chips
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip('All Levels', true),
                      const SizedBox(width: 8),
                      _buildFilterChip('Beginner', false),
                      const SizedBox(width: 8),
                      _buildFilterChip('Intermediate', false),
                      const SizedBox(width: 8),
                      _buildFilterChip('Advanced', false),
                    ],
                  ),
                ),
              ),
              
              // Modules List
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Your Learning Path',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.filter_list,
                              color: Color.fromRGBO(52, 141, 188, 1),
                              size: 18,
                            ),
                            label: const Text(
                              'Filter',
                              style: TextStyle(
                                color: Color.fromRGBO(52, 141, 188, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      
                      Expanded(
                        child: ListView(
                          children: [
                            _buildModuleCard(
                              'Introduction to Mobile Development',
                              'Beginner',
                              200,
                              1.0,
                              const Color(0xFF4CAF50),
                            ),
                            const SizedBox(height: 12),
                            _buildModuleCard(
                              'React Native Fundamentals',
                              'Beginner',
                              250,
                              0.65,
                              const Color(0xFF4CAF50),
                            ),
                            const SizedBox(height: 12),
                            _buildModuleCard(
                              'Navigation & Routing',
                              'Intermediate',
                              300,
                              0.3,
                              const Color.fromRGBO(52, 141, 188, 1),
                            ),
                            const SizedBox(height: 12),
                            _buildModuleCard(
                              'State Management with Redux',
                              'Intermediate',
                              350,
                              0.0,
                              const Color.fromRGBO(52, 141, 188, 1),
                            ),
                            const SizedBox(height: 12),
                            _buildModuleCard(
                              'API Integration & Data Fetching',
                              'Intermediate',
                              300,
                              0.0,
                              const Color.fromRGBO(52, 141, 188, 1),
                            ),
                            const SizedBox(height: 12),
                            _buildModuleCard(
                              'Advanced Animations',
                              'Advanced',
                              400,
                              0.0,
                              const Color(0xFF9C27B0),
                            ),
                            const SizedBox(height: 12),
                            _buildModuleCard(
                              'Performance Optimization',
                              'Advanced',
                              450,
                              0.0,
                              const Color(0xFF9C27B0),
                            ),
                            const SizedBox(height: 12),
                            _buildModuleCard(
                              'Publishing to App Stores',
                              'Advanced',
                              500,
                              0.0,
                              const Color(0xFF9C27B0),
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, 1),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromRGBO(52, 141, 188, 1)
            : Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected
              ? const Color.fromRGBO(52, 141, 188, 1)
              : Colors.white.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildModuleCard(
    String title,
    String level,
    int xp,
    double progress,
    Color levelColor,
  ) {
    return Container(
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
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF666666),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: levelColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  level,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: levelColor,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.stars,
                color: Colors.amber.shade600,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '+$xp XP',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade600,
                ),
              ),
            ],
          ),
          if (progress > 0) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(levelColor),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${(progress * 100).toInt()}% Complete',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF666666),
              ),
            ),
          ],
        ],
      ),
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
