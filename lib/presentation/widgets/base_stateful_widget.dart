import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:biv_manager/core/di/injection_container.dart';
import 'package:biv_manager/core/constants/app_constants.dart';
import 'package:biv_manager/core/constants/string_constants.dart';

/// Base stateful widget that provides access to theme, localization, and DI.
abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T> {
  /// Access to theme
  ThemeData get theme => Theme.of(context);

  /// Access to localization
  AppLocalizations get l10n => AppLocalizations.of(context)!;

  /// Access to DI container
  Tdi di<Tdi extends Object>() => sl<Tdi>();

  /// Access to app constants
  AppConstants get appConstants => AppConstants();

  /// Access to string constants
  StringConstants get stringConstants => StringConstants();
}
