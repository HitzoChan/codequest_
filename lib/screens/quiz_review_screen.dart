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
                    if (ts is DateTime) date = ts;
                    else if (ts != null && ts is Map && ts['_seconds'] != null) {
                      date = DateTime.fromMillisecondsSinceEpoch((ts['_seconds'] as int) * 1000);
                    }

                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text('Quiz: $quizId'),
                        subtitle: Text('Score: $score / $total\n${date != null ? date.toLocal().toString() : ''}'),
                        isThreeLine: true,
                        trailing: ElevatedButton(
                          child: const Text('Review'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/quiz-review-detail', arguments: a);
                          },
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
