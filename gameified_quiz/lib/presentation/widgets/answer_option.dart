import 'package:flutter/material.dart';
import 'dart:math' as math; // Sallanma efekti için

class AnswerOption extends StatefulWidget { // StatefulWidget'a dönüştü
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool? isCorrect;
  final bool isDisabled;

  const AnswerOption({
    super.key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
    this.isCorrect,
    this.isDisabled = false,
  });

  @override
  State<AnswerOption> createState() => _AnswerOptionState();
}

class _AnswerOptionState extends State<AnswerOption>
    with SingleTickerProviderStateMixin { // Animasyon için TickerProvider ekle
  late AnimationController _controller;
  late Animation<double> _scaleAnimation; // Doğru cevap için scale
  late Animation<double> _shakeAnimation; // Yanlış cevap için shake

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // Scale animasyonu (doğru cevapta 1.0 -> 1.05 -> 1.0)
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.05), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.05, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Shake animasyonu (yanlış cevapta)
    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 5.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 5.0, end: -5.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: -5.0, end: 5.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 5.0, end: -5.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: -5.0, end: 0.0), weight: 10),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _triggerAnimationIfNeeded(null); // Initial state check
  }

  @override
  void didUpdateWidget(covariant AnswerOption oldWidget) {
    super.didUpdateWidget(oldWidget);
    _triggerAnimationIfNeeded(oldWidget); // Trigger animation on update
  }

  void _triggerAnimationIfNeeded(AnswerOption? oldWidget) {
    // Sadece seçiliyken ve durum değiştiğinde animasyonu tetikle
    bool justBecameCorrect = widget.isCorrect == true && oldWidget?.isCorrect != true && widget.isSelected;
    bool justBecameIncorrect = widget.isCorrect == false && oldWidget?.isCorrect != false && widget.isSelected;

    if (justBecameCorrect || justBecameIncorrect) {
       _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Duruma göre ikon döndüren yardımcı fonksiyon
  Icon? _getTrailingIcon() {
    if (widget.isCorrect == true) {
      return const Icon(Icons.check_circle, color: Colors.green);
    } else if (widget.isCorrect == false) {
      return const Icon(Icons.cancel, color: Colors.red);
    } else if (widget.isSelected) {
      return const Icon(Icons.radio_button_checked); // Seçili ama henüz doğrulanmamış
    }
    return const Icon(Icons.radio_button_unchecked); // Normal durum
  }

  // Duruma göre arka plan rengini döndüren yardımcı fonksiyon
  Color _getBackgroundColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (widget.isCorrect == true) {
      return Colors.green.shade100;
    } else if (widget.isCorrect == false) {
      return Colors.red.shade100;
    } else if (widget.isSelected) {
      return colorScheme.secondary.withOpacity(0.2);
    }
    return colorScheme.surface; // Temanın yüzey rengi
  }

    // Duruma göre kenarlık rengini döndüren yardımcı fonksiyon
  Color _getBorderColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
     if (widget.isCorrect == true) {
      return Colors.green;
    } else if (widget.isCorrect == false) {
      return Colors.red;
    } else if (widget.isSelected) {
      return colorScheme.secondary;
    }
    return colorScheme.outline.withOpacity(0.5); // Hafif kenarlık
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final backgroundColor = _getBackgroundColor(context);
    final borderColor = _getBorderColor(context);
    final foregroundColor = widget.isCorrect != null
        ? (widget.isCorrect! ? Colors.green.shade900 : Colors.red.shade900)
        : textTheme.bodyLarge?.color;

    // AnimatedBuilder ile animasyonları uygula
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Sallanma için transform
        final transform = (widget.isCorrect == false)
            ? Matrix4.translationValues(_shakeAnimation.value, 0.0, 0.0)
            : Matrix4.identity();
        // Büyüme için transform
        final scale = (widget.isCorrect == true) ? _scaleAnimation.value : 1.0;

        return Transform.scale(
           scale: scale,
           child: Transform( // Sallanma için Transform widget'ı
              transform: transform,
              child: child,
            ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ElevatedButton(
          onPressed: widget.isDisabled ? null : widget.onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            elevation: widget.isSelected ? 2 : 1,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(
                color: borderColor,
                width: widget.isSelected ? 2.0 : 1.0,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.text,
                  style: textTheme.bodyLarge?.copyWith(color: foregroundColor),
                  textAlign: TextAlign.center,
                ),
              ),
              if (_getTrailingIcon() != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: _getTrailingIcon(),
                ),
            ],
          ),
        ),
      ),
    );
  }
} 