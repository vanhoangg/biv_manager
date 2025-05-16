import 'package:flutter/material.dart';

/// Base class for theme events
abstract class ThemeEvent {}

/// Event to set light theme
class SetLightTheme extends ThemeEvent {}

/// Event to set dark theme
class SetDarkTheme extends ThemeEvent {}

/// Event to set system theme
class SetSystemTheme extends ThemeEvent {}

/// Event to toggle theme
class ToggleTheme extends ThemeEvent {}

/// Event to set custom theme
class SetCustomTheme extends ThemeEvent {
  /// Theme mode to set
  final ThemeMode themeMode;

  /// Color scheme to set
  final ColorScheme colorScheme;

  /// Text theme to set
  final TextTheme textTheme;

  /// Constructor
  SetCustomTheme({
    required this.themeMode,
    required this.colorScheme,
    required this.textTheme,
  });
}
