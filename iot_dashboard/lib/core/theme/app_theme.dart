import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_dashboard/core/constants/ui_constants.dart';

/// Uygulamanın genel temasını tanımlar.
class AppTheme {
  // --- Açık Tema Renkleri --- 
  static const Color _lightPrimaryColor = Color(0xFF007AFF);
  static const Color _lightSecondaryColor = Color(0xFF30D158);
  static const Color _lightAccentColor = Color(0xFFFF9F0A);
  static const Color _lightBackgroundColor = Color(0xFFF0F4F8);
  static const Color _lightCardBackgroundColor = Colors.white;
  static const Color _lightTextColorPrimary = Color(0xFF1C1C1E);
  static const Color _lightTextColorSecondary = Color(0xFF8A8A8E);
  static const Color _lightErrorColor = Color(0xFFFF453A);
  static const Color _lightAppBarTextColor = Colors.white;

  // --- Koyu Tema Renkleri --- 
  static const Color _darkPrimaryColor = Color(0xFF63E6FE); // Cyan/Turkuaz Vurgu
  static const Color _darkSecondaryColor = Color(0xFF30D158); // Yeşil (Alternatif vurgu)
  static const Color _darkBackgroundColor = Color(0xFF121212); // Daha koyu arkaplan
  static const Color _darkSurfaceColor = Color(0xFF1E1E1E); // Kart/Yüzey Rengi (Biraz daha koyu)
  static const Color _darkTextColorPrimary = Color(0xFFE0E0E0); // Hafif kırık beyaz metin
  static const Color _darkTextColorSecondary = Color(0xFF9E9E9E); // Orta gri ikincil metin
  static const Color _darkErrorColor = Color(0xFFCF6679); // Material Design Koyu Hata Rengi
  static const Color _darkAppBarTextColor = _darkTextColorPrimary;

  /// Açık tema ayarları.
  static ThemeData get lightTheme {
    final baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      primaryColor: _lightPrimaryColor,
      scaffoldBackgroundColor: _lightBackgroundColor,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: _lightPrimaryColor,
        onPrimary: _lightAppBarTextColor,
        secondary: _lightSecondaryColor,
        onSecondary: Colors.white,
        error: _lightErrorColor,
        onError: Colors.white,
        background: _lightBackgroundColor,
        onBackground: _lightTextColorPrimary,
        surface: _lightCardBackgroundColor,
        onSurface: _lightTextColorPrimary,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme).copyWith(
        displayLarge: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: _lightTextColorPrimary),
        displayMedium: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: _lightTextColorPrimary),
        displaySmall: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: _lightTextColorPrimary),
        headlineMedium: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: _lightTextColorPrimary),
        headlineSmall: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: _lightTextColorPrimary),
        titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: _lightTextColorPrimary),
        titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: _lightTextColorSecondary),
        bodyLarge: GoogleFonts.poppins(color: _lightTextColorPrimary),
        bodyMedium: GoogleFonts.poppins(color: _lightTextColorPrimary),
        bodySmall: GoogleFonts.poppins(color: _lightTextColorSecondary),
        labelLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: _lightAppBarTextColor),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _lightPrimaryColor,
        foregroundColor: _lightAppBarTextColor,
        elevation: 4.0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: _lightAppBarTextColor,
        ),
        iconTheme: const IconThemeData(color: _lightAppBarTextColor),
      ),
      cardTheme: CardThemeData(
        elevation: 3.0,
        color: _lightCardBackgroundColor,
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UiConstants.borderRadiusMedium),
        ),
        margin: const EdgeInsets.symmetric(vertical: UiConstants.marginSmall),
      ),
      iconTheme: IconThemeData(color: _lightTextColorSecondary, size: UiConstants.iconSizeMedium),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightSecondaryColor,
        foregroundColor: Colors.white,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  // --- Koyu Tema --- 
  static ThemeData get darkTheme {
    final baseTheme = ThemeData.dark();
    return baseTheme.copyWith(
      primaryColor: _darkPrimaryColor,
      scaffoldBackgroundColor: _darkBackgroundColor,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: _darkPrimaryColor,
        onPrimary: Colors.black, // Vurgu rengi açık olduğu için üzerindeki siyah iyi durur
        secondary: _darkSecondaryColor,
        onSecondary: Colors.black, // İkincil vurgu üzerindeki
        error: _darkErrorColor,
        onError: _darkTextColorPrimary,
        background: _darkBackgroundColor,
        onBackground: _darkTextColorPrimary,
        surface: _darkSurfaceColor,
        onSurface: _darkTextColorPrimary,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme).copyWith(
        displayLarge: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: _darkTextColorPrimary),
        displayMedium: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: _darkTextColorPrimary),
        displaySmall: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: _darkTextColorPrimary),
        headlineMedium: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: _darkTextColorPrimary),
        headlineSmall: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: _darkTextColorPrimary),
        titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: _darkTextColorPrimary),
        titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: _darkTextColorSecondary),
        bodyLarge: GoogleFonts.poppins(color: _darkTextColorPrimary),
        bodyMedium: GoogleFonts.poppins(color: _darkTextColorPrimary),
        bodySmall: GoogleFonts.poppins(color: _darkTextColorSecondary),
        labelLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.black), // Buton Metni (onPrimary gibi)
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _darkSurfaceColor,
        foregroundColor: _darkTextColorPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: _darkTextColorPrimary,
        ),
        iconTheme: const IconThemeData(color: _darkTextColorPrimary),
      ),
      cardTheme: CardThemeData(
        elevation: 1.0,
        color: _darkSurfaceColor,
        shadowColor: Colors.black.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UiConstants.borderRadiusMedium),
        ),
        margin: const EdgeInsets.symmetric(vertical: UiConstants.marginSmall),
      ),
      // Koyu Tema Varsayılan İkon Rengi: Beyaz
      iconTheme: IconThemeData(color: _darkTextColorPrimary, size: UiConstants.iconSizeMedium),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _darkPrimaryColor,
        foregroundColor: Colors.black, // onPrimary gibi
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
