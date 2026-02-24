import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/injection_container.dart' as app_di;

/// App-specific navigation guard policy.
class AppNavigationGuard {
  /// Check if the current user is authenticated.
  static bool isAuthenticated() {
    final prefs = app_di.sl<SharedPreferences>();
    return prefs.getString(AppConstants.storageKeys.token) != null;
  }

  /// Redirect handler for protected/auth routes.
  static String? redirect(BuildContext context, GoRouterState state) {
    final isAuthRoute = state.matchedLocation == AppConstants.routes.login ||
        state.matchedLocation == AppConstants.routes.register ||
        state.matchedLocation == AppConstants.routes.forgotPassword;

    final authenticated = isAuthenticated();
    if (!authenticated && !isAuthRoute) return AppConstants.routes.login;
    if (authenticated && isAuthRoute) return AppConstants.routes.home;
    return null;
  }
}
