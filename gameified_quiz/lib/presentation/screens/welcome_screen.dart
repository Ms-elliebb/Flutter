import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// StatefulWidget'a dönüştürüldü
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150), // Kısa animasyon süresi
      lowerBound: 0.0,
      upperBound: 0.05, // Ne kadar küçülecek/büyüyecek
    )..addListener(() {
        setState(() {}); // Controller değiştiğinde UI güncellenmeli
      });

    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Butona basıldığında animasyonu tetikleyen fonksiyonlar
  void _onTapDown(TapDownDetails details) {
    _controller.forward(); // Animasyonu başlat (küçült)
  }

  void _onTapUp(TapUpDetails details) {
    // Sadece animasyonu tersine çevir, navigasyon onTap'te
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse(); // İptal edilirse animasyonu geri al
  }

  // Navigasyon için onTap fonksiyonu
  void _handleTap() {
     // Kısa bir gecikme ekleyerek animasyonun görünmesini sağla (isteğe bağlı)
    Future.delayed(const Duration(milliseconds: 50), () {
       if (mounted) { // context'in hala geçerli olup olmadığını kontrol et
         context.go('/topics');
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final double scale = 1 - _scaleAnimation.value; // Butonu küçültmek için 1'den çıkar

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.quiz, // Veya başka bir ikon
                size: 100,
                color: colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'Quiz Uygulamasına Hoş Geldiniz!',
                style: textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Flutter bilginizi test etmeye hazır mısınız?',
                style: textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Butonu GestureDetector ile sarıp animasyon ekle
              GestureDetector(
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                onTapCancel: _onTapCancel,
                onTap: _handleTap, // Navigasyon için onTap kullan
                child: Transform.scale(
                  scale: scale,
                  child: ElevatedButton.icon(
                    // onPressed null olmalı çünkü GestureDetector kullanıyoruz
                    onPressed: null, // null olarak bırakmak önemli
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Hadi Başlayalım!'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      textStyle: textTheme.titleLarge,
                       // null onPressed ile butonun devre dışı görünmesini engelle
                       backgroundColor: colorScheme.primary,
                       foregroundColor: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 