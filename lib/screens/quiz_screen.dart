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
    final mid = args is String ? args : '';
    moduleId = mid;
    startTime = DateTime.now();

    // Map known module IDs to their quiz data
    if (moduleId == 'web_dev_ch1_pdf') {
      questions = WebDevPdfQuiz.questions;
    } else if (moduleId == 'web_dev_intermediate_ch1') {
      questions = IntermediateWebDevQuiz.questions;
    } else if (moduleId == 'web_dev_adv_from_pdf') {
      questions = AdvancedWebDevQuiz.questions;
    } else {
      questions = WebDevPdfQuiz.questions;
    }
    // initialize answers list to track per-question selections
    answers = List<int?>.filled(questions.length, null);
    // load user hearts for UI and penalty logic
    _loadUserHearts();
  }

  @override
  void initState() {
    super.initState();
    // Larger single-scale animation for a prominent popup
    _heartAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _scaleAnim = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _heartAnimController, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _heartAnimController.dispose();
    super.dispose();
  }

  Future<void> _showHeartBrokenAnimation(int remaining) async {
    if (!mounted) return;
    _heartAnimController.reset();

    // Make the popup modal and clearly visible
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 166),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, a1, a2) {
        return Center(
          child: AnimatedBuilder(
            animation: _heartAnimController,
            builder: (context, child) {
              final scale = _scaleAnim.value;
              return Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6))],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.scale(
                            scale: scale,
                            child: Icon(
                              Icons.heart_broken,
                              size: 140,
                              color: Colors.red.shade400,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text('Heart lost', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)),
                          const SizedBox(height: 6),
                          Text('$remaining remaining', style: const TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );

    try {
      await _heartAnimController.forward().orCancel;
    } catch (_) {}
    // Hold visible for a short moment so user reads it
    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    
    // If no hearts remaining, navigate to modules instead of just popping
    if (remaining <= 0) {
      Navigator.pushReplacementNamed(context, '/modules');
    } else {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  Future<void> _loadUserHearts() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    try {
      final fs = FirestoreService();
      // Ensure regeneration is applied first (may update hearts in Firestore)
      final regen = await fs.ensureHeartsUpdated(uid);
      if (regen != null) {
        setState(() { _userHearts = regen; });
        return;
      }

      // Fallback to reading profile directly
      final snap = await fs.getUserProfile(uid);
      if (snap.exists && snap.data() != null) {
        final data = snap.data()!;
        final val = data['hearts'];
        int hearts = 5;
        if (val is int) {
          hearts = val;
        } else if (val is num) {
          hearts = val.toInt();
        }
        setState(() { _userHearts = hearts; });
      } else {
        setState(() { _userHearts = 5; });
      }
    } catch (_) {
      setState(() { _userHearts = 5; });
    }
  }

  Future<void> selectAnswer(int index) async {
    if (showResult) return;

    final isCorrect = questions[currentIndex].correctIndex == index;
    if (isCorrect) {
      score++;
    } else {
      // If hearts are loaded and zero, block answering
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (_userHearts != null && _userHearts! <= 0) {
        if (mounted) {
          showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierColor: Colors.black.withValues(alpha: 166),
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, a1, a2) {
              return Center(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 16, offset: Offset(0, 8))],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.heart_broken, size: 100, color: Colors.red.shade400),
                        const SizedBox(height: 16),
                        const Text('No Hearts Left', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
                        const SizedBox(height: 8),
                        const Text('Quiz ended. You can try again later!', style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.4)),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade400,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacementNamed(context, '/modules');
                            },
                            child: const Text('Back to Modules', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return;
      }

      // Decrement one heart for every wrong answer (guarded by showResult to avoid rapid double taps)
      if (uid != null) {
        try {
          final fs = FirestoreService();
          final newHearts = await fs.decrementUserHearts(uid, 1);
            if (mounted) {
            setState(() { _userHearts = newHearts ?? _userHearts; });
            // show broken heart animation with remaining count
            _showHeartBrokenAnimation(newHearts ?? _userHearts ?? 0);
            if (newHearts != null && newHearts <= 0) {
              // show exhausted dialog and end quiz
              showGeneralDialog(
                context: context,
                barrierDismissible: false,
                barrierColor: Colors.black.withValues(alpha: 166),
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, a1, a2) {
                  return Center(
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 16, offset: Offset(0, 8))],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.heart_broken, size: 100, color: Colors.red.shade400),
                            const SizedBox(height: 16),
                            const Text('No Hearts Left', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
                            const SizedBox(height: 8),
                            const Text('Quiz ended. You can try again later!', style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.4)),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade400,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushReplacementNamed(context, '/modules');
                                },
                                child: const Text('Back to Modules', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        } catch (e) {
          debugPrint('Failed to decrement heart: $e');
        }
      }
    }

    // record answer locally for persistence
    if (answers.length > currentIndex) answers[currentIndex] = index;

    setState(() {
      selectedIndex = index;
      showResult = true;
    });

    // short delay then move to next or finish
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        showResult = false;
        selectedIndex = null;
        if (currentIndex < questions.length - 1) {
          currentIndex++;
        } else {
          // finished
          _handleQuizFinished();
        }
      });
    });
  }

  Future<void> _handleQuizFinished() async {
    // compute duration
    final end = DateTime.now();
    final durationMs = startTime == null ? 0 : end.difference(startTime!).inMilliseconds;

    // record attempt if signed in
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final passed = score >= ((questions.length / 2).ceil());

    bool saved = false;
    Map<String, dynamic>? localAttempt;
    if (uid != null) {
      try {
        final fs = FirestoreService();
        await fs.recordQuizAttemptDetailed(uid, moduleId, score, passed, durationMs, answers);
        // If the user passed, mark the module as completed in user_progress
        if (passed) {
          try {
            await fs.completeModule(uid, moduleId);
          } catch (e) {
            // ignore but log
            debugPrint('Failed to mark module completed: $e');
          }
        }
        // Recalculate aggregated learning stats immediately so Profile reflects changes
        try {
          await fs.recalculateLearningStatsForUser(uid);
        } catch (e) {
          debugPrint('Failed to recalc learning stats: $e');
        }
        // award XP for passing quiz: flat +30 XP when passed
        final xp = passed ? 30 : 0;
        int? newTotalXp;
        if (xp > 0) {
          newTotalXp = await fs.addXp(uid, xp, source: 'quiz_pass', moduleId: moduleId);
        }
        saved = true;
        localAttempt = {
          'quizId': moduleId,
          'score': score,
          'answers': answers,
          'attemptedAt': DateTime.now(),
        };
        // attach earned xp and new total for UI actions
        if (newTotalXp != null) {
          localAttempt['earned_xp'] = xp;
          localAttempt['new_total_xp'] = newTotalXp;
        }
      } catch (e) {
        // ignore errors for now but log
        // ignore: avoid_print
        debugPrint('Failed to record quiz attempt: $e');
      }
    }
    if (!mounted) return;
    // show modern completion modal (centered)
    if (!mounted) return;
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Quiz Completed',
      barrierColor: Colors.black.withValues(alpha: 128),
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (context, a1, a2) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.86,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF5AB4D8), Color(0xFF3585B5)]),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 6))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.emoji_events, size: 56, color: Colors.white),
                  const SizedBox(height: 12),
                  Text('Quiz Completed', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('You scored', style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 6),
                  Text('$score / ${questions.length}', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  if (saved && localAttempt != null && localAttempt.containsKey('earned_xp'))
                    Text('+${localAttempt['earned_xp']} XP awarded', style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF1A3A52)),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      ),
                      const SizedBox(width: 12),
                      if (saved)
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.white70)),
                          onPressed: () {
                            Navigator.of(context).pop();
                            if (localAttempt != null) Navigator.pushNamed(context, '/quiz-review-detail', arguments: localAttempt);
                          },
                          child: const Text('Review Attempt'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: const Center(child: Text('No quiz found.')),
      );
    }

    final q = questions[currentIndex];

    // Design: gradient background, question card, and card-style options
    final bgGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF0F3B5F), Color(0xFF0A2A43)],
    );

    final selectedGradient = const LinearGradient(
      colors: [Color(0xFF5AB4D8), Color(0xFF3585B5)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: bgGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress pill
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Question ${currentIndex + 1} / ${questions.length}',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.95), fontWeight: FontWeight.w600),
                  ),
                ),

                const SizedBox(height: 8),
                // Hearts row with animated switcher (centered)
                if (_userHearts != null)
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                    child: Center(
                      key: ValueKey<int>(_userHearts!),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) {
                          final filled = i < (_userHearts ?? 0);
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.favorite,
                              color: filled ? const Color(0xFFE53935) : const Color(0xFFBDBDBD),
                              size: 22,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                const SizedBox(height: 14),

                // Question card
                Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      q.question,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F3B5F),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Options
                Column(
                  children: List.generate(q.choices.length, (idx) {
                    final isSelected = selectedIndex == idx;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Material(
                        elevation: isSelected ? 8 : 4,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => selectAnswer(idx),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: isSelected
                                  ? selectedGradient
                                  : null,
                              color: isSelected ? null : const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.06),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    q.choices[idx],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                      color: isSelected ? Colors.white : const Color(0xFF12324A),
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(Icons.check_circle, color: Colors.white)
                                else
                                  const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
