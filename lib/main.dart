import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Import from packages
import 'package:auth/index.dart';
import 'package:app/biv_manager_app.dart';
import 'package:app/firebase_options.dart';
import 'package:core/di/injection_container.dart' as di;
import 'package:shared/index.dart';

import 'l10n/output/app_localizations.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/splash/splash_page.dart';

/// Main app entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize dependency injection
  await di.init();
  LocalizationService.registerAppLocalizationLookup(AppLocalizations.of);

  runApp(
    BivManagerApp(
      routerConfig: _router,
      extraLocalizationsDelegates: const [AppLocalizations.delegate],
    ),
  );
}

final GoRouter _router = GoRouter(
  initialLocation: AppConstants.routes.splash,
  redirect: (context, state) {
    if (state.matchedLocation == AppConstants.routes.splash) {
      return NavigationGuard.isAuthenticated()
          ? AppConstants.routes.home
          : AppConstants.routes.login;
    }

    return NavigationGuard.redirect(context, state);
  },
  routes: [
    GoRoute(
      path: AppConstants.routes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppConstants.routes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppConstants.routes.register,
      builder: (context, state) => BlocProvider<AuthBloc>(
        create: (_) => di.sl<AuthBloc>(),
        child: const RegisterPage(),
      ),
    ),
    GoRoute(
      path: AppConstants.routes.forgotPassword,
      builder: (context, state) => BlocProvider<AuthBloc>(
        create: (_) => di.sl<AuthBloc>(),
        child: const ForgotPasswordPage(),
      ),
    ),
    GoRoute(
      path: AppConstants.routes.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
