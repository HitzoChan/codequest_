import 'package:flutter/material.dart';
import '../backend/quiz_data.dart';

// This screen displays the details of a saved attempt passed as the route argument.
class QuizReviewDetailScreen extends StatelessWidget {
  const QuizReviewDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attempt = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (attempt == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Attempt Review')),
        body: const Center(child: Text('No attempt data provided')),
      );
    }

    final quizId = attempt['quizId'] as String? ?? '';
    final answers = (attempt['answers'] as List<dynamic>?)?.map((e) => e as int?).toList() ?? [];
    final score = attempt['score'] ?? 0;
    final attemptedAt = attempt['attemptedAt'];

    // For now only support the SQL quiz mapping
    final questions = quizId == 'sql_intro_01' ? SqlIntroQuiz.questions : SqlIntroQuiz.questions;

    return Scaffold(
      appBar: AppBar(title: const Text('Attempt Review')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quiz: $quizId', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Score: $score / ${questions.length}'),
            const SizedBox(height: 12),
            ...List.generate(questions.length, (i) {
              final q = questions[i];
              final userSel = i < answers.length ? answers[i] : null;
              final correct = q.correctIndex;
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Q${i + 1}: ${q.question}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      ...List.generate(q.choices.length, (ci) {
                        final isUser = userSel == ci;
                        final isCorrect = correct == ci;
                        Color bg = Colors.white;
                        if (isCorrect) bg = Colors.green.withOpacity(0.12);
                        if (isUser && !isCorrect) bg = Colors.red.withOpacity(0.12);
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Text(q.choices[ci])),
                              if (isCorrect) const Icon(Icons.check, color: Colors.green),
                              if (isUser && !isCorrect) const Icon(Icons.close, color: Colors.red),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
