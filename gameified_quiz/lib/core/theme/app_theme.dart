import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Renk Sabitleri (Örnek - Projeye göre özelleştirilmeli)
  static const Color primaryColor = Color(0xFF4CAF50); // Yeşil tonu
  static const Color secondaryColor = Color(0xFFFFC107); // Amber tonu
  static const Color accentColor = Color(0xFF03A9F4); // Açık mavi tonu
  static const Color backgroundColor = Color(0xFFF5F5F5); // Açık gri arka plan
  static const Color errorColor = Color(0xFFF44336); // Kırmızı
  static const Color textColor = Color(0xFF212121); // Koyu gri metin
  static const Color cardColor = Colors.white;

  // Açık Tema (Light Theme)
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor, // Accent yerine tertiary kullanılabilir
        background: backgroundColor,
        surface: cardColor, // Kart gibi yüzeyler için
        error: errorColor,
        onPrimary: Colors.white, // Primary renk üzerindeki metin/ikon rengi
        onSecondary: Colors.black, // Secondary renk üzerindeki metin/ikon rengi
        onBackground: textColor, // Arka plan üzerindeki metin rengi
        onSurface: textColor, // Yüzeyler üzerindeki metin rengi
        onError: Colors.white, // Hata rengi üzerindeki metin rengi
      ),
      textTheme: GoogleFonts.poppinsTextTheme( // Google Fonts ile TextTheme
        ThemeData.light().textTheme.copyWith( // Mevcut temayı kopyala
              // Başlıklar
              displayLarge: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: textColor),
              displayMedium: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: textColor),
              displaySmall: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: textColor),
              headlineMedium: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: textColor),
              headlineSmall: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: textColor),
              titleLarge: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: textColor),
              // Gövde Metinleri
              bodyLarge: const TextStyle(fontSize: 16.0, color: textColor),
              bodyMedium: const TextStyle(fontSize: 14.0, color: textColor),
              // Buton Metni
              labelLarge: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white, // AppBar üzerindeki ikon ve metin rengi
        elevation: 4.0,
        titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white, // Buton üzerindeki metin rengi
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: cardColor,
        elevation: 2.0,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: accentColor, width: 2.0),
        ),
        labelStyle: const TextStyle(color: textColor),
      ),
      // Diğer widget temaları buraya eklenebilir (örn: floatingActionButtonTheme)
    );
  }

  // Koyu Tema (Dark Theme) - İsteğe bağlı
  // static ThemeData get darkTheme {
  //   // Koyu tema tanımlamaları...
  // }
} 