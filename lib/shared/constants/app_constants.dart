/// App constants class that holds all the app level constants
class AppConstants {
  /// App name
  static const String appName = 'Biv Manager';

  /// Route names
  static const String routeSplash = '/';
  static const String routeLogin = '/login';
  static const String routeRegister = '/register';
  static const String routeForgotPassword = '/forgot-password';
  static const String routeHome = '/home';
  static const String routeDashboard = '/home/dashboard';
  static const String routeCustomers = '/home/customers';
  static const String routeCustomerDetail = '/home/customers/:id';
  static const String routeTransactions = '/home/transactions';
  static const String routeTransactionDetail = '/home/transactions/:id';
  static const String routeReports = '/home/reports';
  static const String routeSettings = '/home/settings';
  static const String routeProfile = '/home/profile';

  /// Asset paths
  static const String assetImages = 'assets/images/';
  static const String assetIcons = 'assets/icons/';
  static const String assetFonts = 'assets/fonts/';

  /// API endpoints
  static const String apiLogin = '/auth/login';
  static const String apiRegister = '/auth/register';
  static const String apiForgotPassword = '/auth/forgot-password';
  static const String apiResetPassword = '/auth/reset-password';
  static const String apiCustomers = '/customers';
  static const String apiTransactions = '/transactions';
  static const String apiReports = '/reports';

  /// Storage keys
  static const String storageToken = 'token';
  static const String storageUser = 'user';
  static const String storageTheme = 'theme';
  static const String storageLanguage = 'language';
  static const String storageDirection = 'direction';
  static const String storageFirstTime = 'first_time';
  static const String keyLanguage = 'language_code';

  /// Error messages
  static const String errorNoInternet = 'No internet connection';
  static const String errorServer = 'Server error';
  static const String errorUnknown = 'Unknown error';
  static const String errorInvalidCredentials = 'Invalid credentials';
  static const String errorInvalidEmail = 'Invalid email';
  static const String errorInvalidPassword = 'Invalid password';
  static const String errorInvalidPhone = 'Invalid phone number';
  static const String errorInvalidName = 'Invalid name';
  static const String errorInvalidAmount = 'Invalid amount';
  static const String errorInvalidDate = 'Invalid date';
  static const String errorInvalidNote = 'Invalid note';
  static const String errorInvalidImage = 'Invalid image';
  static const String errorInvalidVoice = 'Invalid voice note';

  /// RTL constants
  static const String rtlLeftToRight = 'Left to Right';
  static const String rtlRightToLeft = 'Right to Left';
  static const String rtlDirection = 'Text Direction';
  static const String rtlDescription = 'Change the text direction of the app';
}
