import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

/// Service to manage text direction (RTL/LTR) in the app
class RTLService extends ChangeNotifier {
  final SharedPreferences _prefs;
  TextDirection _textDirection = TextDirection.ltr;

  RTLService(this._prefs) {
    _loadTextDirection();
  }

  /// Get the current text direction
  TextDirection get textDirection => _textDirection;

  /// Check if the current direction is RTL
  bool get isRTL => _textDirection == TextDirection.rtl;

  /// Load saved text direction from preferences
  Future<void> _loadTextDirection() async {
    final direction = _prefs.getString(AppConstants.storageDirection);
    if (direction != null) {
      _textDirection =
          direction == 'rtl' ? TextDirection.rtl : TextDirection.ltr;
      notifyListeners();
    }
  }

  /// Save text direction to preferences
  Future<void> _saveTextDirection() async {
    await _prefs.setString(
      AppConstants.storageDirection,
      _textDirection == TextDirection.rtl ? 'rtl' : 'ltr',
    );
  }

  /// Set text direction
  Future<void> setTextDirection(TextDirection direction) async {
    if (_textDirection != direction) {
      _textDirection = direction;
      await _saveTextDirection();
      notifyListeners();
    }
  }

  /// Toggle between RTL and LTR
  Future<void> toggleDirection() async {
    await setTextDirection(
      _textDirection == TextDirection.ltr
          ? TextDirection.rtl
          : TextDirection.ltr,
    );
  }

  /// Get supported text directions
  static List<TextDirection> get supportedDirections => [
        TextDirection.ltr,
        TextDirection.rtl,
      ];

  /// Get direction name
  static String getDirectionName(TextDirection direction) {
    return direction == TextDirection.ltr
        ? AppConstants.rtlLeftToRight
        : AppConstants.rtlRightToLeft;
  }
}
