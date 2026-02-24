import '../services/localization_service.dart';
import '../theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:core/di/injection_container.dart';
import '../constants/app_constants.dart';

/// Base page widget that all pages will extend
abstract class BasePage extends BaseStatefulWidget {
  /// Constructor
  const BasePage({super.key});

  /// Build the page title
  String get pageTitle;
}

/// Base stateful widget that provides access to theme, localization, and DI.
abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});
}

/// Base state class that provides access to theme, localization, and DI.
/// Also handles localization errors by showing an error screen.
abstract class BaseState<T extends BaseStatefulWidget> extends State<T> {
  /// Access to theme
  ThemeManager get themeManager => sl<ThemeManager>();

  /// Access to app constants
  AppConstants get appConstants => sl<AppConstants>();

  /// Access to localization
  LocalizationService get localizationService => sl<LocalizationService>();

  /// Resolve app localizations via a bridge registered from the app layer.
  dynamic l10nOf(BuildContext context) {
    return LocalizationService.appL10nOf(context);
  }
}

/// Base stateless widget that provides access to theme, localization, and DI.
abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  /// Access to theme
  ThemeManager get themeManager => sl<ThemeManager>();

  /// Access to app constants
  AppConstants get appConstants => sl<AppConstants>();

  /// Get localization from context
  /// This will throw an error if localization is not available
  dynamic l10nOf(BuildContext context) {
    return LocalizationService.appL10nOf(context);
  }
}
