import 'package:flutter/material.dart';

class AppTheme {
  // Color Palette
  static const Color primaryIndigo = Color(0xFF4F46E5); // Vibrant Indigo
  static const Color secondaryCoral = Color(0xFFFB7185); // Coral Pink
  static const Color accentMint = Color(0xFF34D399); // Mint Accent
  static const Color backgroundLight = Color(0xFFF5F3FF); // Very light indigo tint
  static const Color textDark = Color(0xFF1E1B4B); // Dark Indigo
  static const Color surfaceWhite = Colors.white;

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryIndigo,
        primary: primaryIndigo,
        secondary: secondaryCoral,
        tertiary: accentMint,
        surface: surfaceWhite,
        background: backgroundLight,
        onBackground: textDark,
      ),
      scaffoldBackgroundColor: backgroundLight,
      fontFamily: 'Rounded Mplus 1c', // Suggestion, falls back to default if not loaded
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: textDark,
          fontWeight: FontWeight.bold,
          fontSize: 32,
          letterSpacing: 1.2,
        ),
        headlineMedium: TextStyle(
          color: textDark,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        bodyLarge: TextStyle(
          color: textDark,
          fontSize: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryIndigo,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: primaryIndigo.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: surfaceWhite,
        shadowColor: primaryIndigo.withOpacity(0.1),
      ),
    );
  }
}
