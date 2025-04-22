import 'package:flutter/foundation.dart';
import 'question_model.dart';

@immutable
class Quiz {
  final String id;
  final String title;
  final String description; // Quiz hakkında kısa açıklama
  final String topicId; // İlişkili olduğu konu (örn: 'flutter_widgets')
  final List<Question> questions;
  // İsteğe bağlı: Quiz ikonu, zorluk seviyesi vb.
  // final String? iconUrl;
  // final String? difficultyLevel;

  const Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.topicId,
    required this.questions,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Quiz &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          topicId == other.topicId &&
          listEquals(questions, other.questions);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      topicId.hashCode ^
      questions.hashCode;
} 