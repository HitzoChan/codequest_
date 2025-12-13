import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../backend/quizzes.dart';
import '../backend/firestore_service.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  List<QuizQuestion> questions = [];
  int currentIndex = 0;
  int score = 0;
  bool showResult = false;
  int? selectedIndex;
  String moduleId = '';
  DateTime? startTime;
  List<int?> answers = [];
  int? _userHearts;

  late final AnimationController _heartAnimController;
  late final Animation<double> _scaleAnim;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments;
    moduleId = args is String ? args : "";
    startTime = DateTime.now();

    // Load questions based on moduleId
    if (moduleId == 'mobile_dev_beginner_ch1') {
      questions = BeginnerMobileDevQuiz.questions;
    } else if (moduleId == 'mobile_dev_intermediate_ch1') {
      questions = IntermediateMobileDevQuiz.questions;
    } else if (moduleId == 'mobile_dev_advanced_ch1') {
      questions = AdvancedMobileDevQuiz.questions;
    } else {
      questions = BeginnerMobileDevQuiz.questions;
    }

    answers = List<int?>.filled(questions.length, null);
    _loadUserHearts();
  }

  @override
  void initState() {
    super.initState();
    _heartAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _scaleAnim = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _heartAnimController, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _heartAnimController.dispose();
    super.dispose();
  }

  // HEART POPUP ANIMATION
  Future<void> _showHeartBrokenAnimation(int remaining) async {
    if (!mounted) return;

    _heartAnimController.reset();

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 160),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: AnimatedBuilder(
            animation: _heartAnimController,
            builder: (context, _) {
              final scale = _scaleAnim.value;
              return Material(
                color: Colors.transparent,
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.heart_broken, size: 120, color: Colors.red.shade400),
                        const SizedBox(height: 12),
                        const Text("Heart lost",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text("$remaining remaining",
                            style: const TextStyle(fontSize: 14, color: Colors.black54)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );

    await _heartAnimController.forward();

    await Future.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;

    if (remaining <= 0) {
      Navigator.pushReplacementNamed(context, '/modules');
    } else {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  // Load hearts from Firestore
  Future<void> _loadUserHearts() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    try {
      final fs = FirestoreService();
      final regen = await fs.ensureHeartsUpdated(uid);

      if (regen != null) {
        setState(() => _userHearts = regen);
        return;
      }

      final snap = await fs.getUserProfile(uid);
      if (snap.exists && snap.data() != null) {
        final hearts = snap.data()!["hearts"] ?? 5;
        setState(() => _userHearts = hearts);
      } else {
        setState(() => _userHearts = 5);
      }
    } catch (_) {
      setState(() => _userHearts = 5);
    }
  }

  // When an answer is selected
  Future<void> selectAnswer(int index) async {
    if (showResult) return;

    final isCorrect = questions[currentIndex].correctIndex == index;

    if (!isCorrect) {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null && _userHearts != null && _userHearts! > 0) {
        final fs = FirestoreService();
        final newHearts = await fs.decrementUserHearts(uid, 1);

        if (mounted) {
          setState(() => _userHearts = newHearts);
        }

        _showHeartBrokenAnimation(newHearts ?? 0);
      }
    } else {
      score++;
    }

    answers[currentIndex] = index;

    setState(() {
      selectedIndex = index;
      showResult = true;
    });

    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    setState(() {
      showResult = false;
      selectedIndex = null;

      if (currentIndex < questions.length - 1) {
        currentIndex++;
      } else {
        _handleQuizFinished();
      }
    });
  }

  // Handle quiz finish
  Future<void> _handleQuizFinished() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final passed = score >= ((questions.length / 2).ceil());

    Map<String, dynamic> attempt = {
      "quizId": moduleId,
      "score": score,
      "answers": answers,
      "attemptedAt": DateTime.now(),
    };

    if (uid != null) {
      try {
        final fs = FirestoreService();
        await fs.recordQuizAttemptDetailed(uid, moduleId, score, passed, 0, answers);

        if (passed) await fs.completeModule(uid, moduleId);
        await fs.recalculateLearningStatsForUser(uid);
      } catch (e) {
        debugPrint("Failed saving attempt: $e");
      }
    }

    if (!mounted) return;

    // Show result dialog
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF5AB4D8), Color(0xFF3585B5)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.emoji_events, size: 60, color: Colors.white),
                const SizedBox(height: 12),
                const Text("Quiz Completed",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("$score / ${questions.length}",
                    style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(
                          context,
                          "/quiz-review-detail",
                          arguments: attempt,
                        );
                      },
                      child: const Text("Review"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // UI
  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No quiz available")),
      );
    }

    final q = questions[currentIndex];

    final bgGradient = const LinearGradient(
      colors: [Color(0xFF0F3B5F), Color(0xFF0A2A43)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final selectedGradient = const LinearGradient(
      colors: [Color(0xFF5AB4D8), Color(0xFF3585B5)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Quiz"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: bgGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Progress
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Question ${currentIndex + 1} / ${questions.length}",
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.95),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Hearts
                if (_userHearts != null)
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Row(
                      key: ValueKey(_userHearts),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (i) {
                        final filled = i < (_userHearts ?? 0);
                        return Icon(Icons.favorite,
                            color: filled ? Colors.red : Colors.grey, size: 22);
                      }),
                    ),
                  ),

                const SizedBox(height: 16),

                // Question
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    q.question,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF0F3B5F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Options
                Column(
                  children: List.generate(q.choices.length, (i) {
                    final selected = selectedIndex == i;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: selected ? selectedGradient : null,
                          color: selected ? null : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => selectAnswer(i),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    q.choices[i],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                                      color: selected ? Colors.white : const Color(0xFF12324A),
                                    ),
                                  ),
                                ),
                                if (selected)
                                  const Icon(Icons.check_circle, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 20),

                // Robot Mascot
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 2000),
                  builder: (_, value, child) {
                    final bounce = -10 * (0.5 - (value - 0.5).abs()) * 2;
                    return Transform.translate(offset: Offset(0, bounce), child: child);
                  },
                  onEnd: () => setState(() {}),
                  child: Column(
                    children: [
                      Image.asset('assets/images/robot.png', height: 70),
                      const SizedBox(height: 8),
                      Text(
                        currentIndex < questions.length - 1
                            ? "Keep going! 🚀"
                            : "Last question! 💪",
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
