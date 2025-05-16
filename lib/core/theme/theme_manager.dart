import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

/// Theme manager class that handles theme state and persistence
class ThemeManager extends ChangeNotifier {
  /// Shared preferences instance
  final SharedPreferences _prefs;

  /// Current theme mode
  ThemeMode _themeMode = ThemeMode.system;

  /// Get current theme mode
  ThemeMode get themeMode => _themeMode;

  /// Constructor
  ThemeManager(this._prefs) {
    _loadThemeMode();
  }

  /// Load saved theme from shared preferences
  Future<void> _loadThemeMode() async {
    final themeMode = _prefs.getString(AppConstants.storageTheme);
    if (themeMode != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (mode) => mode.toString() == themeMode,
        orElse: () => ThemeMode.system,
      );
      notifyListeners();
    }
  }

  /// Save theme to shared preferences
  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode != mode) {
      _themeMode = mode;
      await _prefs.setString(AppConstants.storageTheme, mode.toString());
      notifyListeners();
    }
  }

  /// Set light theme
  void setLightTheme() {
    setThemeMode(ThemeMode.light);
  }

  /// Set dark theme
  void setDarkTheme() {
    setThemeMode(ThemeMode.dark);
  }

  /// Set system theme
  void setSystemTheme() {
    setThemeMode(ThemeMode.system);
  }

  /// Toggle theme
  void toggleTheme() {
    setThemeMode(
      _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
