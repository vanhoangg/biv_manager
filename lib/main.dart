import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// Import from packages
import 'package:app/firebase_options.dart';
import 'package:core/di/injection_container.dart' as di;
import 'package:shared/index.dart';

// Import from main app
import 'core/di/injection_container.dart';
import 'presentation/pages/splash/splash_page.dart';

/// Main app entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize dependency injection
  await init();

  runApp(const MyApp());
}

/// Main app widget
class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = di.sl<ThemeManager>();
    final localizationService = di.sl<LocalizationService>();

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
          home: const SplashPage(),
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
