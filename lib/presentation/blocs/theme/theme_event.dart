import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

/// Theme events
abstract class ThemeEvent extends Equatable {
  /// Constructor
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

/// Set dark theme event
class SetDarkTheme extends ThemeEvent {
  /// Constructor
  const SetDarkTheme();
}

/// Set light theme event
class SetLightTheme extends ThemeEvent {
  /// Constructor
  const SetLightTheme();
}

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
  const SetCustomTheme({
    required this.themeMode,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  List<Object?> get props => [themeMode, colorScheme, textTheme];
}
