import 'package:flutter/material.dart';
import '../backend/quizzes.dart';

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
    final score = attempt['score'] is int
      ? attempt['score'] as int
      : (attempt['score'] is num ? (attempt['score'] as num).toInt() : 0);

    // Map quizId to the appropriate question bank
    late final List<QuizQuestion> questions;
    if (quizId == 'web_dev_ch1_pdf') {
      questions = WebDevPdfQuiz.questions;
    } else if (quizId == 'web_dev_intermediate_ch1') {
      questions = IntermediateWebDevQuiz.questions;
    } else if (quizId == 'web_dev_adv_from_pdf' || quizId == 'python_advanced_01' || quizId == 'data_structures_advanced') {
      questions = AdvancedWebDevQuiz.questions;
    } else {
      // Unknown quiz id: fall back to the beginner quiz and indicate unknown id in header
      questions = WebDevPdfQuiz.questions;
    }

    // Theme-aligned readable colors
    final bg = const Color(0xFF0D2B3A); // app background tone
    final cardColor = const Color(0xFF12324A); // slightly lighter card
    final optionDefault = const Color(0xFF0F3B5F);
    final correctColor = const Color(0xFF2E7D32);
    final wrongColor = const Color(0xFFC62828);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (result, didPop) {
        Navigator.pushReplacementNamed(context, '/modules');
      },
      child: Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          title: const Text('Attempt Review'),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/modules');
              },
              tooltip: 'Close',
            ),
          ],
        ),
        body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quiz: $quizId', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            Text('Score: $score / ${questions.length}', style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 4),
            Text('Answers received: ${answers.length} out of ${questions.length}', style: const TextStyle(color: Colors.white54, fontSize: 12)),
            const SizedBox(height: 12),
            ...List.generate(questions.length, (i) {
              final q = questions[i];
              // Get the user's selected answer for this question (may be null)
              final userSel = i < answers.length ? answers[i] : null;
              final correct = q.correctIndex;
              
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: cardColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('Q${i + 1}: ${q.question}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...List.generate(q.choices.length, (ci) {
                        final isUser = userSel == ci;
                        final isCorrectChoice = correct == ci;
                        Color bgOpt = optionDefault;
                        Color textColor = Colors.white70;
                        BoxDecoration bd = BoxDecoration(
                          color: bgOpt,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white10),
                        );
                        String? badge;
                        
                        // Show correct answer in green
                        if (isCorrectChoice) {
                          bd = BoxDecoration(color: correctColor, borderRadius: BorderRadius.circular(8));
                          textColor = Colors.white;
                          badge = '✓ Correct Answer';
                        } 
                        // Show user's wrong answer in red
                        else if (isUser && userSel != null && !isCorrectChoice) {
                          bd = BoxDecoration(color: wrongColor, borderRadius: BorderRadius.circular(8));
                          textColor = Colors.white;
                          badge = '✗ Your Answer';
                        }

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: bd,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      q.choices[ci],
                                      style: TextStyle(color: textColor, fontSize: 15, fontWeight: (isUser && userSel != null) || isCorrectChoice ? FontWeight.w700 : FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              if (badge != null) ...[
                                const SizedBox(height: 6),
                                Text(
                                  badge,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
