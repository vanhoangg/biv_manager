import '../../l10n/output/app_localizations.dart';
import '../services/localization_service.dart';
import '../theme/theme_manager.dart';
import 'package:flutter/material.dart';
import '../../core/di/injection_container.dart';
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

  /// This will throw an error if localization is not available
  AppLocalizations l10nOf(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    if (localizations == null) {
      throw FlutterError(
        'Localization not found. Make sure you have wrapped your app with MaterialApp and provided the localization delegates.',
      );
    }
    return localizations;
  }

  @override
  void initState() {
    super.initState();
    print("initState ${T.toString()}");
  }

  @override
  void dispose() {
    print("dispose ${T.toString()}");
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies ${T.toString()}");
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget ${T.toString()}");
  }

  @override
  void setState(VoidCallback fn) {
    print("setState called ${T.toString()}");
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    print("build ${T.toString()}");
    return const SizedBox.shrink();
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
  AppLocalizations l10nOf(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    if (localizations == null) {
      throw FlutterError(
        'Localization not found. Make sure you have wrapped your app with MaterialApp and provided the localization delegates.',
      );
    }
    return localizations;
  }
}
