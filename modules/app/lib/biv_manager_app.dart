import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared/constants/app_constants.dart';
import 'package:shared/services/localization_service.dart';
import 'package:shared/theme/theme_manager.dart';

/// Reusable app shell for the monorepo's main application.
///
/// The root `/lib/main.dart` should handle bootstrap (Firebase, DI, route
/// composition) and then pass the configured router into this widget.
class BivManagerApp extends StatelessWidget {
  /// Creates the app shell.
  const BivManagerApp({
    required this.routerConfig,
    this.extraLocalizationsDelegates = const [],
    super.key,
  });

  /// Router configuration supplied by the root app entrypoint.
  final RouterConfig<Object> routerConfig;

  /// Additional delegates (for app-specific generated localizations).
  final List<LocalizationsDelegate<dynamic>> extraLocalizationsDelegates;

  @override
  Widget build(BuildContext context) {
    final themeManager = GetIt.I<ThemeManager>();
    final localizationService = GetIt.I<LocalizationService>();

    return ListenableBuilder(
      listenable: Listenable.merge([themeManager, localizationService]),
      builder: (context, _) {
        return MaterialApp.router(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: themeManager.lightTheme,
          darkTheme: themeManager.darkTheme,
          themeMode: themeManager.themeMode,
          locale: localizationService.locale,
          localizationsDelegates: [
            ...extraLocalizationsDelegates,
            ...LocalizationService.localizationsDelegates,
          ],
          supportedLocales: LocalizationService.supportedLocales,
          routerConfig: routerConfig,
          builder: (context, child) {
            return ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            );
          },
        );
      },
    );
  }
}
