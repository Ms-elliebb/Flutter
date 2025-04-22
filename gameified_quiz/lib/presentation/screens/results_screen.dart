import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/quiz_provider.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sonuçları almak için QuizProvider'ı kullan
    final quizProvider = context.read<QuizProvider>();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Eğer quiz tamamlanmadıysa veya veri yoksa güvenlik kontrolü
    if (quizProvider.status != QuizStatus.completed || quizProvider.currentQuiz == null) {
      // Veya kullanıcıyı başka bir ekrana yönlendir
      return Scaffold(
        appBar: AppBar(title: const Text('Sonuçlar')),
        body: const Center(
          child: Text('Görüntülenecek quiz sonucu bulunamadı.'),
        ),
      );
    }

    final quiz = quizProvider.currentQuiz!;
    final score = quizProvider.score;
    final totalQuestions = quiz.questions.length;
    // Doğru cevap sayısı hesapla
    final correctAnswers = quizProvider.userAnswers.entries.where((entry) {
       // Null check ve soru bulma
       final question = quiz.questions.firstWhere((q) => q.id == entry.key, orElse: () => quiz.questions.first /* Geçici fallback */);
       return entry.value == question.correctAnswerIndex;
    }).length;
    final incorrectAnswers = totalQuestions - correctAnswers; // Yanlış cevap sayısı

    return Scaffold(
      appBar: AppBar(
        title: Text('${quiz.title} Sonucu'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        automaticallyImplyLeading: false, // Geri butonunu kaldır (isteğe bağlı)
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animasyonlu Başlık (isteğe bağlı)
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0.0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: Text('Quiz Tamamlandı!', style: textTheme.headlineMedium),
              ),
              const SizedBox(height: 24),
              _buildResultStat(
                context,
                icon: Icons.star_border,
                label: 'Puan',
                value: score, // Integer olarak gönder
                color: colorScheme.secondary,
              ),
              const SizedBox(height: 16),
              _buildResultStat(
                context,
                icon: Icons.check_circle_outline,
                label: 'Doğru Cevap',
                value: correctAnswers, // Integer olarak gönder
                suffix: ' / $totalQuestions',
                color: Colors.green.shade600,
              ),
              const SizedBox(height: 16),
              _buildResultStat(
                context,
                icon: Icons.highlight_off,
                label: 'Yanlış Cevap',
                value: incorrectAnswers, // Integer olarak gönder
                suffix: ' / $totalQuestions',
                color: Colors.red.shade600,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text('Tekrar Oyna'),
                onPressed: () {
                  quizProvider.resetQuiz();
                  // Aynı quize geri dön
                  context.go('/quiz/${quiz.id}');
                },
                style: ElevatedButton.styleFrom(
                   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                   textStyle: textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                 icon: const Icon(Icons.list_alt),
                 label: const Text('Konu Seçimine Dön'),
                 onPressed: () => context.go('/topics'),
                  style: TextButton.styleFrom(
                   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                   textStyle: textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Tekrarlanan sonuç satırları için yardımcı widget (Değer int, suffix eklendi)
  Widget _buildResultStat(BuildContext context, {required IconData icon, required String label, required int value, String suffix = '', required Color color}) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(width: 12),
        Text('$label:', style: textTheme.titleLarge),
        const SizedBox(width: 8),
        // Değeri animasyonlu göstermek için AnimatedSwitcher
        AnimatedSwitcher(
           duration: const Duration(milliseconds: 300),
           transitionBuilder: (Widget child, Animation<double> animation) {
             // Aşağıdan yukarı kayma ve fade animasyonu
             final offsetAnimation = Tween<Offset>(
               begin: const Offset(0.0, 0.3),
               end: Offset.zero,
             ).animate(animation);
             return FadeTransition(
               opacity: animation,
               child: SlideTransition(position: offsetAnimation, child: child),
             );
           },
           child: Text(
              // Key, AnimatedSwitcher'ın değişikliği algılaması için önemli
              '$value$suffix',
              key: ValueKey<int>(value), // Değere göre Key
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
        ),
      ],
    );
  }
} 