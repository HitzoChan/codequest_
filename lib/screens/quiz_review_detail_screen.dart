import 'package:flutter/material.dart';
import '../backend/quizzes.dart';

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

    final quizId = attempt['quizId'] ?? "";
    final answers = (attempt['answers'] as List?)?.map((e) => e as int?).toList() ?? [];
    final score = attempt['score'] as int? ?? 0;

    late final List<QuizQuestion> questions;
    if (quizId == 'info_mgmt_beginner_ch1') {
      questions = BeginnerInformationManagementQuiz.questions;
    } else if (quizId == 'info_mgmt_intermediate_ch1') {
      questions = IntermediateInformationManagementQuiz.questions;
    } else if (quizId == 'info_mgmt_advanced_ch1') {
      questions = AdvancedInformationManagementQuiz.questions;
    } else {
      questions = BeginnerInformationManagementQuiz.questions;
    }

    final optionDefault = const Color(0xFF0F3B5F);
    final correctColor = const Color(0xFF2E7D32);
    final wrongColor = const Color(0xFFC62828);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pushReplacementNamed(context, '/modules');
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0D2B3A),
        appBar: AppBar(
          title: const Text("Attempt Review"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, '/modules'),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pushReplacementNamed(context, "/modules"),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Quiz: $quizId",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 6),
              Text("Score: $score / ${questions.length}",
                  style: const TextStyle(color: Colors.white70)),
              const SizedBox(height: 12),

              ...List.generate(questions.length, (i) {
                final q = questions[i];
                final userAnswer = i < answers.length ? answers[i] : null;
                final correct = q.correctIndex;

                return Card(
                  color: const Color(0xFF12324A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Q${i + 1}: ${q.question}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                        const SizedBox(height: 14),

                        ...List.generate(q.choices.length, (ci) {
                          final isCorrect = ci == correct;
                          final isUserSelection = ci == userAnswer;

                          // Base box color
                          Color bg = optionDefault;
                          Color textColor = Colors.white70;

                          if (isCorrect) {
                            bg = correctColor;
                            textColor = Colors.white;
                          }

                          if (isUserSelection && !isCorrect) {
                            bg = wrongColor;
                            textColor = Colors.white;
                          }

                          // Badge text under the box
                          String? badge;
                          if (isCorrect) {
                            badge = isUserSelection
                                ? "✓ Your Answer (Correct)"
                                : "✓ Correct Answer";
                          }
                          if (isUserSelection && !isCorrect) {
                            badge = "✗ Your Answer";
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Option box (same height always)
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  color: bg,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  q.choices[ci],
                                  style: TextStyle(
                                    color: textColor,
                                    fontWeight: (isCorrect || isUserSelection)
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ),

                              // Badge BELOW the box (spacing consistent)
                              if (badge != null)
                                Padding(
                                  padding: const EdgeInsets.only(left: 4, bottom: 8),
                                  child: Text(
                                    badge,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        })
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
