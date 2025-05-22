import 'package:flutter/material.dart';

import 'theme_manager.dart';

/// Theme inherited widget that provides theme state to the widget tree
class ThemeInheritedWidget extends InheritedWidget {
  /// Theme manager instance
  final ThemeManager themeManager;

  /// Constructor
  const ThemeInheritedWidget({
    super.key,
    required this.themeManager,
    required super.child,
  });

  /// Get theme manager from context
  static ThemeInheritedWidget of(BuildContext context) {
    final ThemeInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
    assert(result != null, 'No ThemeInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    return themeManager != oldWidget.themeManager;
  }
}
