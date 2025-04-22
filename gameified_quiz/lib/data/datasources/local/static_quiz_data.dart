import '../../models/question_model.dart';
import '../../models/quiz_model.dart';

// Başlangıç için örnek statik quiz verileri
// Gerçek uygulamada bu veriler bir API'den, veritabanından veya dosyadan okunabilir.

class StaticQuizData {
  static final List<Quiz> quizzes = [
    // Flutter Temelleri Quizi
    Quiz(
      id: 'quiz_flutter_basics',
      title: 'Flutter Temelleri',
      description: 'Flutter\'ın temel widget\'ları ve konseptleri hakkında bir quiz.',
      topicId: 'flutter_basics',
      questions: [
        Question(
          id: 'q_basics_1',
          text: 'Flutter\'da UI oluşturmak için temel yapı taşı nedir?',
          options: ['Widget', 'Component', 'Element', 'Node'],
          correctAnswerIndex: 0,
        ),
        Question(
          id: 'q_basics_2',
          text: 'StatelessWidget ve StatefulWidget arasındaki temel fark nedir?',
          options: [
            'StatelessWidget durum saklamaz, StatefulWidget saklar.',
            'StatefulWidget daha hızlıdır.',
            'StatelessWidget animasyonlar için kullanılır.',
            'Fark yoktur.'
          ],
          correctAnswerIndex: 0,
        ),
        Question(
          id: 'q_basics_3',
          text: 'Bir widget\'ın ekranda nasıl görüneceğini hangi metot belirler?',
          options: ['constructor', 'initState', 'build', 'dispose'],
          correctAnswerIndex: 2,
        ),
        Question(
          id: 'q_basics_4',
          text: 'Flutter\'da paketleri yönetmek için kullanılan dosya hangisidir?',
          options: ['pubspec.yaml', 'project.json', 'config.xml', 'build.gradle'],
          correctAnswerIndex: 0,
        ),
        Question(
          id: 'q_basics_5',
          text: 'Hot Reload ne işe yarar?',
          options: [
            'Uygulamayı yeniden başlatır.',
            'Sadece kod değişikliklerini uygulayıp state\'i korur.',
            'Uygulamayı derler.',
            'Hata ayıklama modunu açar.'
          ],
          correctAnswerIndex: 1,
        ),
      ],
    ),
    // Dart Programlama Dili Quizi (Örnek)
    Quiz(
      id: 'quiz_dart_lang',
      title: 'Dart Programlama Dili',
      description: 'Dart dilinin temelleri üzerine bir quiz.',
      topicId: 'dart_lang',
      questions: [
        Question(
          id: 'q_dart_1',
          text: 'Dart dilinde bir değişkeni final olarak tanımlamak ne anlama gelir?',
          options: [
            'Değeri asla değiştirilemez (compile-time constant).',
            'Değeri sadece bir kez atanabilir (runtime constant).',
            'Değişken null olabilir.',
            'Değişken public\'tir.'
          ],
          correctAnswerIndex: 1,
        ),
        Question(
          id: 'q_dart_2',
          text: 'Dart\'ta null safety için kullanılan operatör hangisidir?',
          options: ['??', '!?', '?.', 'Hepsi'],
          correctAnswerIndex: 3,
        ),
        // ... daha fazla dart sorusu eklenebilir
      ],
    ),
    // State Management Quizi (Boş Örnek)
     Quiz(
      id: 'quiz_state_mgmt',
      title: 'Flutter State Management',
      description: 'Provider, Riverpod, Bloc gibi state management çözümleri.',
      topicId: 'flutter_state',
      questions: [], // Başlangıçta boş, daha sonra eklenebilir
    ),
  ];

  // Belirli bir ID'ye sahip quizi getiren yardımcı metot
  static Quiz? getQuizById(String id) {
    try {
      return quizzes.firstWhere((quiz) => quiz.id == id);
    } catch (e) {
      return null; // Bulunamadı
    }
  }

  // Belirli bir konuya ait quizleri getiren yardımcı metot
  static List<Quiz> getQuizzesByTopic(String topicId) {
    return quizzes.where((quiz) => quiz.topicId == topicId).toList();
  }

  // Tüm quiz konularını (şimdilik sadece başlıklar) getiren metot
  // Daha sonra ayrı bir Topic modeli oluşturulabilir
  static List<Map<String, String>> getQuizTopics() {
    // Benzersiz topicId ve title çiftlerini al
    // final topics = quizzes.map((quiz) => {'id': quiz.topicId, 'title': quiz.title}).toSet();
    // Set'i tekrar List<Map>'e dönüştür
    // return topics.map((topicMap) => topicMap).toList();
     // Daha basit yaklaşım (her quiz için başlık gösterir):
     return quizzes.map((quiz) => {'id': quiz.id, 'title': quiz.title /* , 'description': quiz.description */}).toList();

  }
} 