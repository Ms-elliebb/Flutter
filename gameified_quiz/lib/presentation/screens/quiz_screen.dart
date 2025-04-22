import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/quiz_provider.dart';
import '../widgets/question_card.dart';
import '../widgets/answer_option.dart';
import '../widgets/progress_bar.dart';

class QuizScreen extends StatefulWidget {
  final String quizId;
  const QuizScreen({super.key, required this.quizId});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    // Ekran açıldığında QuizProvider'a quizi yüklemesini söyle
    // `addPostFrameCallback` içinde çağırmak, build metodu tamamlandıktan sonra çalışmasını sağlar.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuizProvider>(context, listen: false).loadQuiz(widget.quizId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // QuizProvider'ı dinle
    final quizProvider = context.watch<QuizProvider>();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    Widget body;

    // Duruma göre farklı widget'lar göster
    switch (quizProvider.status) {
      case QuizStatus.loading:
        body = const Center(child: CircularProgressIndicator());
        break;
      case QuizStatus.initial:
         body = Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Text('Quiz yüklenemedi veya bulunamadı.'),
               const SizedBox(height: 16),
               ElevatedButton(
                 onPressed: () => context.go('/topics'),
                 child: const Text('Konu Seçimine Geri Dön'),
               ),
            ],
          ),
        );
        break;
      case QuizStatus.loaded:
      case QuizStatus.answering:
      case QuizStatus.correct:
      case QuizStatus.incorrect:
        final question = quizProvider.currentQuestion;
        final quiz = quizProvider.currentQuiz;
        if (question == null || quiz == null) {
          body = const Center(child: Text('Soru veya Quiz yüklenemedi!'));
        } else {
          final progressValue = (quizProvider.currentQuestionIndex + 1) / quiz.questions.length;
          body = Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ProgressBar(value: progressValue),
                ),
                Text(
                  'Soru ${quizProvider.currentQuestionIndex + 1} / ${quiz.questions.length}',
                  style: textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                // AnimatedSwitcher ile soru değişimini animasyonlu hale getir
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                     // Kayma (Slide) ve Solma (Fade) animasyonu
                    final offsetAnimation = Tween<Offset>(
                      begin: const Offset(0.5, 0.0), // Sağdan gelsin
                      end: Offset.zero,
                    ).animate(animation);
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(position: offsetAnimation, child: child),
                    );
                  },
                  child: QuestionCard(
                    // Soru değiştikçe widget'ın yeniden oluşması için Key kullan
                    key: ValueKey<String>(question.id),
                    questionText: question.text,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView.builder(
                    itemCount: question.options.length,
                    itemBuilder: (context, index) {
                      bool isSelected = quizProvider.selectedAnswerForCurrentQuestion == index;
                      bool? isCorrect;
                      bool isDisabled = quizProvider.status == QuizStatus.correct || quizProvider.status == QuizStatus.incorrect;

                      if (isDisabled && isSelected) {
                        isCorrect = quizProvider.status == QuizStatus.correct;
                      }
                      // Doğru cevabı göster (yanlış cevap verildiğinde)
                      else if (isDisabled && index == question.correctAnswerIndex) {
                        isCorrect = true;
                      }

                      return AnswerOption(
                        text: question.options[index],
                        isSelected: isSelected,
                        isCorrect: isCorrect,
                        isDisabled: isDisabled,
                        onTap: isDisabled ? null : () => quizProvider.answerQuestion(context, index),
                      );
                   },
                  ),
                ),
              ],
            ),
          );
        }
        break;
      case QuizStatus.completed:
        body = Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.green, size: 80),
              const SizedBox(height: 16),
              Text('Tebrikler, Quizi Tamamladınız!', style: textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('Puanınız: ${quizProvider.score}', style: textTheme.titleLarge),
              const SizedBox(height: 24),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   TextButton( // Tekrar Oyna
                     onPressed: () => quizProvider.resetQuiz(),
                     child: const Text('Tekrar Oyna'),
                   ),
                   const SizedBox(width: 16),
                   ElevatedButton( // Sonuçlara Git
                     onPressed: () {
                        // TODO: Sonuç verilerini ResultsScreen'e gönder
                       context.go('/results');
                     },
                     child: const Text('Sonuçları Gör'),
                   ),
                 ],
              )
            ],
          ),
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(quizProvider.currentQuiz?.title ?? 'Quiz'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              // AnimatedSwitcher ile puan değişimini animasyonlu hale getir
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  // Basit bir fade animasyonu
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Text(
                  // Key eklemek, AnimatedSwitcher'ın değişikliği algılaması için önemlidir
                  'Puan: ${quizProvider.score}',
                  key: ValueKey<int>(quizProvider.score), // Puan değerine göre Key
                  style: textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        leading: IconButton(
           icon: const Icon(Icons.close),
           onPressed: () {
             // TODO: Kullanıcıya emin misiniz diye sorulabilir
             context.go('/topics'); // Konu seçimine dön
           },
        ),
      ),
      body: body,
    );
  }
} 