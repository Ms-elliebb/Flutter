import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value; // 0.0 ile 1.0 arasında bir değer
  final double height;

  const ProgressBar({
    super.key,
    required this.value,
    this.height = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // Değerin 0 ile 1 arasında olduğundan emin ol
    final clampedValue = value.clamp(0.0, 1.0);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant, // Arka plan rengi (temadan)
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: clampedValue,
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.primary, // İlerleme rengi (temadan)
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
} 