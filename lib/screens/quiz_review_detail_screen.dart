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
    if (quizId == 'sql_intro_01') {
      questions = SqlIntroQuiz.questions;
    } else if (quizId == 'computing_intro_01') {
      questions = ComputingIntroBeginnerQuiz.questions;
    } else if (quizId == 'programming_fundamentals_01') {
      questions = ProgrammingFundamentalsBeginnerQuiz.questions;
    } else if (quizId == 'web_development_01') {
      questions = WebDevIntermediateQuiz.questions;
    } else if (quizId == 'sql_intermediate_01' || quizId == 'sql_intermediate') {
      questions = SqlIntermediateQuiz.questions;
    } else if (quizId == 'data_structures_advanced_01' || quizId == 'data_structures_advanced') {
      questions = DataStructuresAdvancedQuiz.questions;
    } else {
      // Unknown quiz id: fall back to the intro SQL quiz and indicate unknown id in header
      questions = SqlIntroQuiz.questions;
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
        appBar: AppBar(title: const Text('Attempt Review')),
        body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quiz: $quizId', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            Text('Score: $score / ${questions.length}', style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 12),
            ...List.generate(questions.length, (i) {
              final q = questions[i];
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
                      Text('Q${i + 1}: ${q.question}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 12),
                      ...List.generate(q.choices.length, (ci) {
                        final isUser = userSel == ci;
                        final isCorrect = correct == ci;
                        Color bgOpt = optionDefault;
                        Color textColor = Colors.white70;
                        BoxDecoration bd = BoxDecoration(
                          color: bgOpt,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white10),
                        );
                        Widget? trailing;
                        if (isCorrect) {
                          bd = BoxDecoration(color: correctColor, borderRadius: BorderRadius.circular(8));
                          textColor = Colors.white;
                          trailing = const Icon(Icons.check, color: Colors.white);
                        } else if (isUser && !isCorrect) {
                          bd = BoxDecoration(color: wrongColor, borderRadius: BorderRadius.circular(8));
                          textColor = Colors.white;
                          trailing = const Icon(Icons.close, color: Colors.white);
                        }

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          decoration: bd,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  q.choices[ci],
                                  style: TextStyle(color: textColor, fontSize: 15, fontWeight: isUser || isCorrect ? FontWeight.w700 : FontWeight.w500),
                                ),
                              ),
                              if (trailing != null) trailing,
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
