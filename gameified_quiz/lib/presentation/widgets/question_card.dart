import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String questionText;

  const QuestionCard({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cardTheme = Theme.of(context).cardTheme;

    return Card(
      // CardTheme'den alınan stilleri kullan veya üzerine yaz
      elevation: cardTheme.elevation ?? 4,
      margin: cardTheme.margin ?? const EdgeInsets.symmetric(vertical: 16.0),
      shape: cardTheme.shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0), // İç boşluk
        child: Text(
          questionText,
          style: textTheme.headlineSmall, // Temadan stil al
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
} 