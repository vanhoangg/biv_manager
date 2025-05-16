import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:biv_manager/core/di/injection_container.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/core/constants/string_constants.dart';

/// Base stateless widget that provides access to theme, localization, and DI.
abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  /// Access to theme
  ThemeData theme(BuildContext context) => Theme.of(context);

  /// Access to localization
  AppLocalizations l10n(BuildContext context) => AppLocalizations.of(context)!;

  /// Access to DI container
  T di<T extends Object>() => sl<T>();

  /// Access to app constants
  AppConstants get appConstants => AppConstants();

  /// Access to string constants
  StringConstants get stringConstants => StringConstants();
}
