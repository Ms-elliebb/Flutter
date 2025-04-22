import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/datasources/local/static_quiz_data.dart';

class TopicSelectionScreen extends StatelessWidget {
  const TopicSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = StaticQuizData.getQuizTopics(); // Statik veriden konuları al
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Konu Seçimi'),
        backgroundColor: colorScheme.primary, // AppBar rengini tema ile uyumlu yap
        foregroundColor: colorScheme.onPrimary,
        actions: [
          // Profil Ekranı Butonu
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'Profil',
            onPressed: () {
              context.push('/profile');
            },
          ),
          // Ayarlar Ekranı Butonu
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Ayarlar',
            onPressed: () {
              context.push('/settings');
            },
          ),
          const SizedBox(width: 8), // Sağdan küçük bir boşluk
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          final topicId = topic['id']!;
          final topicTitle = topic['title']!;
          // final topicDescription = topic['description'] ?? ''; // Açıklama varsa kullanılabilir

          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: ListTile(
              leading: Icon(Icons.topic_outlined, color: colorScheme.secondary),
              title: Text(topicTitle, style: textTheme.titleLarge),
              // subtitle: Text(topicDescription), // Açıklama gösterilebilir
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Seçilen konunun quiz ekranına git
                // Rota: /quiz/:topicId (henüz tanımlanmadı)
                 context.go('/quiz/$topicId');
                 print('Seçilen Konu ID: $topicId'); // Debug için
              },
            ),
          );
        },
      ),
    );
  }
} 