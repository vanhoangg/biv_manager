import 'package:core/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

/// Navigation guard service that handles route protection
class NavigationGuard {
  /// Check if user is authenticated
  static bool isAuthenticated() {
    final prefs = sl<SharedPreferences>();
    return prefs.getString(AppConstants.storageKeys.token) != null;
  }

  /// Redirect handler for protected routes
  static String? redirect(BuildContext context, GoRouterState state) {
    final isAuthRoute = state.matchedLocation == AppConstants.routes.login ||
        state.matchedLocation == AppConstants.routes.register ||
        state.matchedLocation == AppConstants.routes.forgotPassword;

    final isAuthenticated = NavigationGuard.isAuthenticated();

    // If user is not authenticated and trying to access protected route
    if (!isAuthenticated && !isAuthRoute) {
      return AppConstants.routes.login;
    }

    // If user is authenticated and trying to access auth route
    if (isAuthenticated && isAuthRoute) {
      return AppConstants.routes.home;
    }

    return null;
  }

  static Future<String?> guard(
      BuildContext context, GoRouterState state) async {
    final prefs = sl<SharedPreferences>();
    final token = prefs.getString(AppConstants.storageKeys.token);

    final isAuthRoute = state.matchedLocation == AppConstants.routes.login ||
        state.matchedLocation == AppConstants.routes.register ||
        state.matchedLocation == AppConstants.routes.forgotPassword;

    if (token == null && !isAuthRoute) {
      return AppConstants.routes.login;
    }

    if (token != null && isAuthRoute) {
      return AppConstants.routes.home;
    }

    return null;
  }
}
