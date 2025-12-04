import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../backend/quiz_data.dart';
import '../backend/firestore_service.dart';
import '../widgets/xp_animation.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuizQuestion> questions = [];
  int currentIndex = 0;
  int score = 0;
  bool showResult = false;
  int? selectedIndex;
  String moduleId = '';
  DateTime? startTime;
  List<int?> answers = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    final mid = args is String ? args : '';
    moduleId = mid;
    startTime = DateTime.now();

    // For now, select the SQL quiz when moduleId matches 'sql_intro_01'
    if (moduleId == 'sql_intro_01') {
      questions = SqlIntroQuiz.questions;
    } else {
      // Default to SQL quiz if we don't recognize the ID
      questions = SqlIntroQuiz.questions;
    }
    // initialize answers list to track per-question selections
    answers = List<int?>.filled(questions.length, null);
  }

  void selectAnswer(int index) {
    if (showResult) return;

    final isCorrect = questions[currentIndex].correctIndex == index;
    if (isCorrect) score++;

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
        // award XP: e.g., 10 XP per correct answer
        final xp = score * 10;
        int? newTotalXp;
        if (xp > 0) {
          newTotalXp = await fs.incrementUserXp(uid, xp, 'quiz_attempt');
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
          // show XP animation
          WidgetsBinding.instance.addPostFrameCallback((_) {
            XpAnimation.show(context, xp);
          });
        }
      } catch (e) {
        // ignore errors for now but print
        // ignore: avoid_print
        print('Failed to record quiz attempt: $e');
      }
    }

    // show score dialog
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: const Text('Quiz Completed'),
          content: Text('Your score: $score / ${questions.length}'),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            if (saved)
              TextButton(
                child: const Text('Review Attempt'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigate to the review detail with the local attempt data
                  if (localAttempt != null) {
                    Navigator.pushNamed(context, '/quiz-review-detail', arguments: localAttempt);
                  }
                },
              ),
          ],
        );
      },
    );

    // Show confirmation Snackbar for saved attempts and awarded XP
    if (saved) {
      final earned = localAttempt != null && localAttempt.containsKey('earned_xp') ? localAttempt['earned_xp'] as int : null;
      final newTotal = localAttempt != null && localAttempt.containsKey('new_total_xp') ? localAttempt['new_total_xp'] as int : null;
      final snackText = earned != null
          ? 'Quiz saved — +$earned XP (Total: ${newTotal ?? '—'})'
          : 'Quiz attempt saved';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(snackText),
          action: SnackBarAction(
            label: 'Review',
            onPressed: () {
              if (localAttempt != null) Navigator.pushNamed(context, '/quiz-review-detail', arguments: localAttempt);
            },
          ),
        ),
      );
    }
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
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Question ${currentIndex + 1} / ${questions.length}',
                    style: TextStyle(color: Colors.white.withOpacity(0.95), fontWeight: FontWeight.w600),
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
                                  color: Colors.black.withOpacity(0.06),
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
