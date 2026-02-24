import 'package:go_router/go_router.dart';
import '../constants/app_constants.dart';
import '../services/navigation_guard.dart';

/// App router configuration
class AppRouter {
  /// Build a router using routes provided by the app layer.
  static GoRouter create({
    required List<RouteBase> routes,
    String? initialLocation,
    GoRouterRedirect? redirect,
  }) {
    return GoRouter(
      initialLocation: initialLocation ?? AppConstants.routes.splash,
      redirect: redirect ?? NavigationGuard.redirect,
      routes: routes,
    );
  }

  /// GoRouter instance
  @Deprecated('Inject app routes with AppRouter.create(...) instead.')
  static GoRouter get router => create(routes: const []);
}
