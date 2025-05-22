import '../constants/app_constants.dart';
import '../constants/string_constants.dart';
import 'package:flutter/material.dart';

import '../../core/di/injection_container.dart';
import '../../l10n/app_localizations.dart';

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

abstract class BaseState<T extends BaseStatefulWidget> extends State<T> {
  /// Access to theme
  ThemeData get theme => Theme.of(context);

  /// Access to localization
  AppLocalizations? get l10n => AppLocalizations.of(context);

  /// Access to app constants
  AppConstants get appConstants => sl<AppConstants>();

  /// Access to string constants
  StringConstants get stringConstants => sl<StringConstants>();

  /// Constructor
  BaseState();

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

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  /// Access to theme
  ThemeData theme(BuildContext context) => Theme.of(context);

  /// Access to localization
  AppLocalizations l10n(BuildContext context) => AppLocalizations.of(context)!;

  /// Access to app constants
  AppConstants get appConstants => sl<AppConstants>();

  /// Access to string constants
  StringConstants get stringConstants => sl<StringConstants>();
}
