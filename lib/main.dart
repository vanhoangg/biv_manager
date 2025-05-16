import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:biv_manager/core/config/app_config.dart';
import 'package:biv_manager/core/di/injection_container.dart' as di;
import 'package:biv_manager/core/theme/theme_inherited_widget.dart';
import 'package:biv_manager/core/theme/theme_manager.dart';
import 'package:biv_manager/core/router/app_router.dart';
import 'package:biv_manager/core/services/localization_service.dart';
import 'package:biv_manager/core/services/rtl_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:biv_manager/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_bloc.dart';
import 'package:biv_manager/presentation/blocs/theme/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize other dependencies
  await di.init();

  // Set up error handling
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorScreen(
      error: details.exception.toString(),
      stackTrace: details.stack,
    );
  };

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
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
            BlocProvider(create: (_) => di.sl<AuthBloc>()),
            BlocProvider(create: (_) => di.sl<ThemeBloc>()),
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
                          theme: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                              seedColor: const Color(0xFF0175C2),
                              brightness: Brightness.light,
                            ),
                            useMaterial3: true,
                          ),
                          darkTheme: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                              seedColor: const Color(0xFF0175C2),
                              brightness: Brightness.dark,
                            ),
                            useMaterial3: true,
                          ),
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

class ErrorScreen extends StatelessWidget {
  final String error;
  final StackTrace? stackTrace;

  const ErrorScreen({
    super.key,
    required this.error,
    this.stackTrace,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'An error occurred:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Text(
                error,
                style: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 16,
                ),
              ),
            ),
            if (stackTrace != null) ...[
              const SizedBox(height: 16),
              const Text(
                'Stack trace:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  stackTrace.toString(),
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConfig.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              ThemeInheritedWidget.of(context).themeManager.toggleTheme();
            },
          ),
        ],
      ),
      body: ResponsiveGridView.builder(
        gridDelegate: const ResponsiveGridDelegate(
          crossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          );
        },
      ),
    );
  }
}
