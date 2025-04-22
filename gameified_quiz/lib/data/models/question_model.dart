import 'package:flutter/foundation.dart';

@immutable
class Question {
  final String id;
  final String text;
  final List<String> options;
  final int correctAnswerIndex;
  // İsteğe bağlı: Soruya özel bir resim veya ipucu eklenebilir
  // final String? imageUrl;
  // final String? hint;

  const Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctAnswerIndex,
  });

  // Eşitlik ve hashCode metodları, özellikle listelerde ve setlerde kullanıldığında önemlidir.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Question &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          listEquals(options, other.options) &&
          correctAnswerIndex == other.correctAnswerIndex;

  @override
  int get hashCode =>
      id.hashCode ^
      text.hashCode ^
      options.hashCode ^
      correctAnswerIndex.hashCode;
} 