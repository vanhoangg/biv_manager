import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/di/injection_container.dart' as di;
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'presentation/blocs/auth/auth_bloc.dart';
import 'presentation/blocs/locale/locale_bloc.dart';
import 'shared/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize other dependencies
  await di.init();

  runApp(
    const MainApp(),
  );
}

class MainApp extends BaseStatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LocaleBloc()),
            BlocProvider(create: (_) => di.sl<AuthBloc>()),
          ],
          child: ListenableBuilder(
            listenable: di.sl<ThemeManager>(),
            builder: (context, _) {
              final themeManager = di.sl<ThemeManager>();
              return ListenableBuilder(
                listenable: di.sl<LocalizationService>(),
                builder: (context, _) {
                  final localizationService = di.sl<LocalizationService>();
                  return ListenableBuilder(
                    listenable: di.sl<RTLService>(),
                    builder: (context, _) {
                      final rtlService = di.sl<RTLService>();
                      return ThemeInheritedWidget(
                        themeManager: themeManager,
                        child: MaterialApp.router(
                          title: AppConfig.appName,
                          debugShowCheckedModeBanner: false,
                          themeMode: themeManager.themeMode,
                          theme: themeManager.lightTheme,
                          darkTheme: themeManager.darkTheme,
                          routerConfig: AppRouter.router,
                          builder: (context, child) {
                            final responsiveChild =
                                ResponsiveBreakpoints.builder(
                              child: child!,
                              breakpoints: [
                                const Breakpoint(
                                    start: 0, end: 450, name: MOBILE),
                                const Breakpoint(
                                    start: 451, end: 800, name: TABLET),
                                const Breakpoint(
                                    start: 801, end: 1920, name: DESKTOP),
                                const Breakpoint(
                                    start: 1921,
                                    end: double.infinity,
                                    name: '4K'),
                              ],
                            );
                            return Directionality(
                              textDirection: rtlService.textDirection,
                              child: responsiveChild,
                            );
                          },
                          locale: localizationService.locale,
                          localizationsDelegates: const [
                            AppLocalizations.delegate,
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate,
                          ],
                          supportedLocales:
                              LocalizationService.supportedLocales,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
