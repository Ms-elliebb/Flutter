import 'package:flutter/foundation.dart';
import 'dart:convert'; // JSON çevrimi için

@immutable
class UserProgress {
  final String userId; // Kullanıcıyı tanımlayan unique ID
  final Map<String, QuizResult> completedQuizzes; // Tamamlanan quiz ID'leri ve sonuçları
  final int totalScore; // Genel toplam puan
  // İsteğe bağlı: Rozetler, seviyeler vb.
  // final List<String> badges;
  // final int level;

  const UserProgress({
    required this.userId,
    this.completedQuizzes = const {},
    this.totalScore = 0,
  });

  // Yeni bir quiz sonucunu ekleyip yeni bir UserProgress nesnesi döndüren yardımcı metot
  UserProgress addQuizResult(String quizId, QuizResult result) {
    final newCompletedQuizzes = Map<String, QuizResult>.from(completedQuizzes);
    newCompletedQuizzes[quizId] = result;
    return UserProgress(
      userId: userId,
      completedQuizzes: newCompletedQuizzes,
      totalScore: totalScore + result.score, // Puanı güncelle
    );
  }

  // JSON Serialization
  Map<String, dynamic> toJson() => {
        'userId': userId,
        // Map'in value'ları QuizResult olduğu için onları da toJson ile çevir
        'completedQuizzes': completedQuizzes.map((key, value) => MapEntry(key, value.toJson())),
        'totalScore': totalScore,
      };

  // JSON Deserialization
  factory UserProgress.fromJson(Map<String, dynamic> json) => UserProgress(
        userId: json['userId'] as String,
        // JSON'dan okunan Map'in value'larını QuizResult.fromJson ile çevir
        completedQuizzes: (json['completedQuizzes'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, QuizResult.fromJson(value as Map<String, dynamic>)),
        ),
        totalScore: json['totalScore'] as int,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProgress &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          mapEquals(completedQuizzes, other.completedQuizzes) &&
          totalScore == other.totalScore;

  @override
  int get hashCode =>
      userId.hashCode ^ completedQuizzes.hashCode ^ totalScore.hashCode;
}

@immutable
class QuizResult {
  final int score;
  final int correctAnswers;
  final int totalQuestions;
  final DateTime completedAt;

  const QuizResult({
    required this.score,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.completedAt,
  });

  // JSON Serialization
  Map<String, dynamic> toJson() => {
        'score': score,
        'correctAnswers': correctAnswers,
        'totalQuestions': totalQuestions,
        // DateTime'ı ISO 8601 string olarak kaydet
        'completedAt': completedAt.toIso8601String(),
      };

  // JSON Deserialization
  factory QuizResult.fromJson(Map<String, dynamic> json) => QuizResult(
        score: json['score'] as int,
        correctAnswers: json['correctAnswers'] as int,
        totalQuestions: json['totalQuestions'] as int,
        // ISO 8601 string'den DateTime'a çevir
        completedAt: DateTime.parse(json['completedAt'] as String),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizResult &&
          runtimeType == other.runtimeType &&
          score == other.score &&
          correctAnswers == other.correctAnswers &&
          totalQuestions == other.totalQuestions &&
          completedAt == other.completedAt;

  @override
  int get hashCode =>
      score.hashCode ^
      correctAnswers.hashCode ^
      totalQuestions.hashCode ^
      completedAt.hashCode;
} 