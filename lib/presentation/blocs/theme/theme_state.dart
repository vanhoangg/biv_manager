import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

/// Theme state class that holds the current theme data
class ThemeState extends Equatable {
  /// Current theme mode
  final ThemeMode themeMode;

  /// Current color scheme
  final ColorScheme colorScheme;

  /// Current text theme
  final TextTheme textTheme;

  /// Whether dark mode is enabled
  final bool isDarkMode;

  /// Constructor
  const ThemeState({
    required this.themeMode,
    required this.colorScheme,
    required this.textTheme,
    this.isDarkMode = false,
  });

  /// Create light theme state
  factory ThemeState.light() {
    return ThemeState(
      themeMode: ThemeMode.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0175C2),
        brightness: Brightness.light,
      ),
      textTheme: const TextTheme(),
    );
  }

  /// Create dark theme state
  factory ThemeState.dark() {
    return ThemeState(
      themeMode: ThemeMode.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0175C2),
        brightness: Brightness.dark,
      ),
      textTheme: const TextTheme(),
    );
  }

  /// Create system theme state
  factory ThemeState.system() {
    return ThemeState(
      themeMode: ThemeMode.system,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF0175C2),
        brightness: Brightness.light,
      ),
      textTheme: const TextTheme(),
    );
  }

  /// Create a copy of this state with the given fields replaced with the new values
  ThemeState copyWith({
    ThemeMode? themeMode,
    ColorScheme? colorScheme,
    TextTheme? textTheme,
    bool? isDarkMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      colorScheme: colorScheme ?? this.colorScheme,
      textTheme: textTheme ?? this.textTheme,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  /// Check if the current theme is dark
  bool get isDarkMode => themeMode == ThemeMode.dark;

  @override
  List<Object?> get props => [themeMode, colorScheme, textTheme, isDarkMode];
}
