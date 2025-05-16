/// App configuration class that holds all the app level configurations
class AppConfig {
  /// Base URL for API calls
  static const String baseUrl = 'https://api.bivmanager.com';

  /// API timeout duration in seconds
  static const int apiTimeout = 30;

  /// App version
  static const String appVersion = '0.1.0';

  /// App name
  static const String appName = 'Biv Manager';

  /// App description
  static const String appDescription = 'Debt Management Application';

  /// Default locale
  static const String defaultLocale = 'en';

  /// Supported locales
  static const List<String> supportedLocales = ['en', 'vi'];

  /// Default theme mode
  static const bool isDarkMode = false;

  /// Default currency
  static const String defaultCurrency = 'VND';

  /// Default date format
  static const String defaultDateFormat = 'dd/MM/yyyy';

  /// Default time format
  static const String defaultTimeFormat = 'HH:mm';

  /// Default date time format
  static const String defaultDateTimeFormat = 'dd/MM/yyyy HH:mm';

  /// Default decimal places
  static const int defaultDecimalPlaces = 2;

  /// Default thousand separator
  static const String defaultThousandSeparator = ',';

  /// Default decimal separator
  static const String defaultDecimalSeparator = '.';

  /// Default currency symbol
  static const String defaultCurrencySymbol = '₫';

  /// Default currency position
  static const bool defaultCurrencyPosition =
      true; // true = prefix, false = suffix
}
