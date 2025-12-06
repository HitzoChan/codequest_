import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../backend/firestore_service.dart';

class QuizReviewScreen extends StatefulWidget {
  const QuizReviewScreen({super.key});

  @override
  State<QuizReviewScreen> createState() => _QuizReviewScreenState();
}

class _QuizReviewScreenState extends State<QuizReviewScreen> {
  final FirestoreService _fs = FirestoreService();
  List<Map<String, dynamic>> _attempts = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadAttempts();
  }

  Future<void> _loadAttempts() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      setState(() {
        _attempts = [];
        _loading = false;
      });
      return;
    }
    final attempts = await _fs.fetchQuizAttemptsForUser(uid);
    setState(() {
      _attempts = attempts;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Attempts')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _attempts.isEmpty
              ? const Center(child: Text('No attempts found.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: _attempts.length,
                  itemBuilder: (context, i) {
                    final a = _attempts[i];
                    final quizId = a['quizId'] ?? '';
                    final score = a['score'] ?? 0;
                    final total = (a['answers'] as List?)?.length ?? 0;
                    final ts = a['attemptedAt'];
                    DateTime? date;
                    if (ts is DateTime) {
                      date = ts;
                    } else if (ts != null && ts is Map && ts['_seconds'] != null) {
                      date = DateTime.fromMillisecondsSinceEpoch((ts['_seconds'] as int) * 1000);
                    }

                    final passed = total > 0 ? score >= ((total / 2).ceil()) : false;
                    final formattedDate = date != null ? '${MaterialLocalizations.of(context).formatFullDate(date.toLocal())} • ${TimeOfDay.fromDateTime(date.toLocal()).format(context)}' : '';

                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F3B5F),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    quizId.isNotEmpty ? 'Quiz: $quizId' : 'Quiz',
                                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: passed ? Colors.green.shade600 : Colors.amber.shade700,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '$score / $total',
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            if (formattedDate.isNotEmpty)
                              Text(formattedDate, style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13)),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF0F3B5F)),
                                  child: const Text('Review', style: TextStyle(fontWeight: FontWeight.w600)),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/quiz-review-detail', arguments: a);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
