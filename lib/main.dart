import 'firebase_options.dart';
import 'shared/services/localization_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/di/injection_container.dart' as di;
import 'shared/constants/app_constants.dart';
import 'shared/theme/theme_manager.dart';

/// Main app entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize other dependencies
  await di.init();

  runApp(const MyApp());
}

/// Main app widget
class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeManager = GetIt.I<ThemeManager>();
    final localizationService = GetIt.I<LocalizationService>();

    return ListenableBuilder(
      listenable: Listenable.merge([themeManager, localizationService]),
      builder: (context, _) {
        return MaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: themeManager.lightTheme,
          darkTheme: themeManager.darkTheme,
          themeMode: themeManager.themeMode,
          locale: localizationService.locale,
          localizationsDelegates: LocalizationService.localizationsDelegates,
          supportedLocales: LocalizationService.supportedLocales,
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
