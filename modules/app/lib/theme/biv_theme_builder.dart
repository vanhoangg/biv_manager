import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App-specific brand theme builders.
class BivThemeBuilder {
  static const _primaryColor = Color(0xFF2196F3);
  static const _secondaryColor = Color(0xFF03A9F4);
  static const _accentColor = Color(0xFF00BCD4);
  static const _errorColor = Color(0xFFE57373);
  static const _backgroundColor = Color(0xFFF5F5F5);
  static const _surfaceColor = Colors.white;
  static const _textColor = Color(0xFF212121);
  static const _textSecondaryColor = Color(0xFF757575);

  static const _darkPrimaryColor = Color(0xFF64B5F6);
  static const _darkSecondaryColor = Color(0xFF4FC3F7);
  static const _darkAccentColor = Color(0xFF4DD0E1);
  static const _darkErrorColor = Color(0xFFEF5350);
  static const _darkBackgroundColor = Color(0xFF121212);
  static const _darkSurfaceColor = Color(0xFF1E1E1E);
  static const _darkTextColor = Color(0xFFE0E0E0);
  static const _darkTextSecondaryColor = Color(0xFFB0B0B0);

  /// Build the light theme for Biv Manager.
  static ThemeData buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: _secondaryColor,
        tertiary: _accentColor,
        error: _errorColor,
        surface: _surfaceColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.white,
        onError: Colors.white,
        onSurface: _textColor,
      ),
      textTheme: GoogleFonts.robotoTextTheme(
        ThemeData.light().textTheme.copyWith(
              displayLarge: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: _textColor),
              displayMedium: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _textColor),
              displaySmall: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: _textColor),
              headlineMedium: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: _textColor),
              headlineSmall: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: _textColor),
              titleLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _textColor),
              bodyLarge: const TextStyle(fontSize: 16, color: _textColor),
              bodyMedium: const TextStyle(fontSize: 14, color: _textSecondaryColor),
              labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: _primaryColor),
            ),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: _surfaceColor, foregroundColor: _textColor, elevation: 0, centerTitle: true),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: _surfaceColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _errorColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _surfaceColor,
        selectedItemColor: _primaryColor,
        unselectedItemColor: _textSecondaryColor,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
      ),
      dividerTheme: const DividerThemeData(color: Color(0xFFE0E0E0), thickness: 1, space: 1),
      chipTheme: ChipThemeData(
        backgroundColor: _backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  /// Build the dark theme for Biv Manager.
  static ThemeData buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _darkSecondaryColor,
        tertiary: _darkAccentColor,
        error: _darkErrorColor,
        surface: _darkSurfaceColor,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onTertiary: Colors.black,
        onError: Colors.black,
        onSurface: _darkTextColor,
      ),
      textTheme: GoogleFonts.robotoTextTheme(
        ThemeData.dark().textTheme.copyWith(
              displayLarge: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: _darkTextColor),
              displayMedium: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _darkTextColor),
              displaySmall: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: _darkTextColor),
              headlineMedium: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: _darkTextColor),
              headlineSmall: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: _darkTextColor),
              titleLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _darkTextColor),
              bodyLarge: const TextStyle(fontSize: 16, color: _darkTextColor),
              bodyMedium: const TextStyle(fontSize: 14, color: _darkTextSecondaryColor),
              labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: _darkPrimaryColor),
            ),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: _darkSurfaceColor, foregroundColor: _darkTextColor, elevation: 0, centerTitle: true),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: _darkSurfaceColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _darkBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _darkPrimaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _darkErrorColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _darkSurfaceColor,
        selectedItemColor: _darkPrimaryColor,
        unselectedItemColor: _darkTextSecondaryColor,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _darkPrimaryColor,
        foregroundColor: Colors.black,
      ),
      dividerTheme: const DividerThemeData(color: Color(0xFF2C2C2C), thickness: 1, space: 1),
      chipTheme: ChipThemeData(
        backgroundColor: _darkBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
