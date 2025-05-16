import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/presentation/blocs/theme/theme_event.dart';
import 'package:biv_manager/presentation/blocs/theme/theme_state.dart';

/// Theme bloc that manages theme state
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  /// Shared preferences instance
  final SharedPreferences _prefs;

  /// Constructor
  ThemeBloc(this._prefs) : super(ThemeState.light()) {
    on<SetLightTheme>(_onSetLightTheme);
    on<SetDarkTheme>(_onSetDarkTheme);
    on<SetSystemTheme>(_onSetSystemTheme);
    on<ToggleTheme>(_onToggleTheme);
    on<SetCustomTheme>(_onSetCustomTheme);

    // Load saved theme
    _loadTheme();
  }

  /// Load saved theme from shared preferences
  void _loadTheme() {
    final themeMode = _prefs.getString(AppConstants.storageTheme);
    if (themeMode != null) {
      switch (themeMode) {
        case 'light':
          add(SetLightTheme());
          break;
        case 'dark':
          add(SetDarkTheme());
          break;
        case 'system':
          add(SetSystemTheme());
          break;
      }
    }
  }

  /// Save theme to shared preferences
  Future<void> _saveTheme(String themeMode) async {
    await _prefs.setString(AppConstants.storageTheme, themeMode);
  }

  /// Handle set light theme event
  void _onSetLightTheme(SetLightTheme event, Emitter<ThemeState> emit) {
    emit(ThemeState.light());
    _saveTheme('light');
  }

  /// Handle set dark theme event
  void _onSetDarkTheme(SetDarkTheme event, Emitter<ThemeState> emit) {
    emit(ThemeState.dark());
    _saveTheme('dark');
  }

  /// Handle set system theme event
  void _onSetSystemTheme(SetSystemTheme event, Emitter<ThemeState> emit) {
    emit(ThemeState.system());
    _saveTheme('system');
  }

  /// Handle toggle theme event
  void _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    if (state.themeMode == ThemeMode.light) {
      add(SetDarkTheme());
    } else {
      add(SetLightTheme());
    }
  }

  /// Handle set custom theme event
  void _onSetCustomTheme(SetCustomTheme event, Emitter<ThemeState> emit) {
    emit(state.copyWith(
      themeMode: event.themeMode,
      colorScheme: event.colorScheme,
      textTheme: event.textTheme,
    ));
  }
}
