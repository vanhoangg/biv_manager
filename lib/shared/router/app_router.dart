import 'package:go_router/go_router.dart';
import '../constants/app_constants.dart';
import '../services/navigation_guard.dart';
import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/auth/register_page.dart';
import '../../presentation/pages/auth/forgot_password_page.dart';
import '../../presentation/pages/splash/splash_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/dashboard/dashboard_page.dart';
import '../../presentation/pages/customers/customers_page.dart';
import '../../presentation/pages/customers/customer_detail_page.dart';
import '../../presentation/pages/transactions/transactions_page.dart';
import '../../presentation/pages/reports/reports_page.dart';
import '../../presentation/pages/settings/settings_page.dart';
import '../../presentation/pages/profile/profile_page.dart';
import '../../presentation/pages/about/about_page.dart';

/// App router configuration
class AppRouter {
  /// GoRouter instance
  static final router = GoRouter(
    initialLocation: AppConstants.routeSplash,
    redirect: NavigationGuard.redirect,
    routes: [
      GoRoute(
        path: AppConstants.routeSplash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppConstants.routeLogin,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppConstants.routeRegister,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppConstants.routeForgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppConstants.routeHome,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppConstants.routeDashboard,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: AppConstants.routeCustomers,
        builder: (context, state) => const CustomersPage(),
      ),
      GoRoute(
        path: '${AppConstants.routeCustomers}/:id',
        builder: (context, state) => CustomerDetailPage(
          customerId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        path: AppConstants.routeTransactions,
        builder: (context, state) => const TransactionsPage(),
      ),
      GoRoute(
        path: AppConstants.routeReports,
        builder: (context, state) => const ReportsPage(),
      ),
      GoRoute(
        path: AppConstants.routeSettings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: AppConstants.routeProfile,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => const AboutPage(),
      ),
    ],
  );
}
