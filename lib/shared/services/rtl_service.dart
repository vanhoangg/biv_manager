import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

/// Service to handle Right-to-Left (RTL) text direction
class RTLService extends ChangeNotifier {
  /// Shared preferences instance
  final SharedPreferences _prefs;

  /// Current text direction
  TextDirection _textDirection = TextDirection.ltr;

  /// Get current text direction
  TextDirection get textDirection => _textDirection;

  /// Constructor
  RTLService(this._prefs) {
    _loadTextDirection();
  }

  /// Load saved text direction from shared preferences
  Future<void> _loadTextDirection() async {
    final isRTL = _prefs.getBool(AppConstants.storageKeys.isRTL) ?? false;
    _textDirection = isRTL ? TextDirection.rtl : TextDirection.ltr;
    notifyListeners();
  }

  /// Save text direction to shared preferences
  Future<void> setTextDirection(TextDirection direction) async {
    if (_textDirection != direction) {
      _textDirection = direction;
      await _prefs.setBool(
        AppConstants.storageKeys.isRTL,
        direction == TextDirection.rtl,
      );
      notifyListeners();
    }
  }

  /// Set RTL text direction
  void setRTL() {
    setTextDirection(TextDirection.rtl);
  }

  /// Set LTR text direction
  void setLTR() {
    setTextDirection(TextDirection.ltr);
  }

  /// Toggle text direction
  void toggleTextDirection() {
    setTextDirection(
      _textDirection == TextDirection.ltr
          ? TextDirection.rtl
          : TextDirection.ltr,
    );
  }

  /// Check if current text direction is RTL
  bool get isRTL => _textDirection == TextDirection.rtl;

  /// Get alignment based on text direction
  Alignment get alignment =>
      isRTL ? Alignment.centerRight : Alignment.centerLeft;

  /// Get start alignment based on text direction
  Alignment get startAlignment =>
      isRTL ? Alignment.centerRight : Alignment.centerLeft;

  /// Get end alignment based on text direction
  Alignment get endAlignment =>
      isRTL ? Alignment.centerLeft : Alignment.centerRight;

  /// Get padding based on text direction
  EdgeInsetsDirectional getDirectionalPadding({
    double start = 0.0,
    double end = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsetsDirectional.only(
      start: start,
      end: end,
      top: top,
      bottom: bottom,
    );
  }

  /// Get margin based on text direction
  EdgeInsetsDirectional getDirectionalMargin({
    double start = 0.0,
    double end = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsetsDirectional.only(
      start: start,
      end: end,
      top: top,
      bottom: bottom,
    );
  }
}
