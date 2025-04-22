import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider import edildi
import '../providers/user_progress_provider.dart'; // UserProgressProvider import edildi
import '../../data/datasources/local/static_quiz_data.dart'; // StaticQuizData import edildi
import 'package:go_router/go_router.dart'; // GoRouter import edildi

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    // UserProgressProvider'ı dinle
    final progressProvider = context.watch<UserProgressProvider>();

    // Yükleniyor durumunu veya veriyi göster
    if (progressProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Profilim')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final userProgress = progressProvider.userProgress;
    // Null kontrolü (eğer veri yüklenemezse)
    final String userName = "Oyuncu"; // TODO: Kullanıcı adı yönetimi ekle
    final int totalScore = userProgress?.totalScore ?? 0;
    final int completedQuizzes = userProgress?.completedQuizzes.length ?? 0;
    final int totalQuizzes = StaticQuizData.quizzes.length; // Toplam quiz sayısı
    final double progressPercent = totalQuizzes > 0 ? completedQuizzes / totalQuizzes : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilim'),
         // Geri butonunu manuel olarak ekle
         leading: IconButton(
           icon: const Icon(Icons.arrow_back),
           onPressed: () => GoRouter.of(context).pop(), // GoRouter.of(context).pop() kullan
           tooltip: 'Geri',
         ),
         backgroundColor: colorScheme.primary,
         foregroundColor: colorScheme.onPrimary,
         actions: [
           // İlerlemeyi sıfırlama butonu (test için)
           IconButton(
             icon: const Icon(Icons.delete_forever),
             tooltip: 'İlerlemeyi Sıfırla',
             onPressed: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Emin misiniz?'),
                    content: const Text('Tüm quiz ilerlemeniz ve puanınız silinecek.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: const Text('İptal'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(true),
                        child: const Text('Sıfırla', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
                if (confirm == true) {
                  // ignore: use_build_context_synchronously
                  context.read<UserProgressProvider>().resetProgress();
                }
             },
           )
         ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              // backgroundColor: colorScheme.secondaryContainer,
              child: Icon(Icons.person, size: 60 /*, color: colorScheme.onSecondaryContainer*/),
            ),
            const SizedBox(height: 16),
            Text(userName, style: textTheme.headlineMedium),
            const SizedBox(height: 32),
            _buildStatCard(context, 'Toplam Puan', '$totalScore', Icons.star, colorScheme.secondary),
            const SizedBox(height: 16),
            _buildStatCard(context, 'Tamamlanan Quiz', '$completedQuizzes / $totalQuizzes', Icons.check_circle, colorScheme.primary),
            const SizedBox(height: 16),

            // Genel İlerleme Çubuğu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Genel İlerleme', style: textTheme.titleMedium),
                       Text('${(progressPercent * 100).toStringAsFixed(0)}%', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                     ],
                  ),
                  const SizedBox(height: 8),
                  // Animasyonlu İlerleme Çubuğu
                  TweenAnimationBuilder<double>(
                     tween: Tween<double>(begin: 0.0, end: progressPercent),
                     duration: const Duration(milliseconds: 800),
                     builder: (context, value, child) {
                       return LinearProgressIndicator(
                          value: value,
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(5),
                          backgroundColor: colorScheme.surfaceVariant,
                          valueColor: AlwaysStoppedAnimation<Color>(colorScheme.tertiary),
                       );
                     },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            if (userProgress != null && userProgress.completedQuizzes.isNotEmpty)
              Expanded(
                child: ListView( // Tamamlanan quiz listesi (opsiyonel)
                  children: [
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 8.0),
                       child: Text('Son Tamamlananlar', style: textTheme.titleMedium),
                     ),
                     ...userProgress.completedQuizzes.entries.map((entry) {
                       // TODO: Quiz başlığını ID yerine göstermek için Quiz verisine erişim gerekebilir
                       // StaticQuizData kullanarak başlığı alalım
                       final quizTitle = StaticQuizData.getQuizById(entry.key)?.title ?? 'Bilinmeyen Quiz';
                       return ListTile(
                         leading: const Icon(Icons.history),
                         title: Text(quizTitle), // Başlık gösterildi
                         subtitle: Text('Puan: ${entry.value.score} - Tarih: ${entry.value.completedAt.toLocal().toString().substring(0, 16)}'),
                       );
                     }).toList(),
                  ],
                ),
              )
            else
              const Padding(
                 padding: EdgeInsets.only(top: 16.0),
                 child: Text('Henüz hiç quiz tamamlamadınız.'),
              ),

          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color iconColor) {
     final textTheme = Theme.of(context).textTheme;
     return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 30),
              const SizedBox(width: 20),
              Expanded( // Genişlemesi için Expanded eklendi
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: textTheme.bodyMedium),
                    Text(value, style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
     );
  }
} 