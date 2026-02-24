/// App constants class that holds all the app level constants
class AppConstants {
  /// App name
  static const String appName = 'Biv Manager';

  /// Route names
  static const Routes routes = Routes();

  /// Asset paths
  static const Assets assets = Assets();

  /// API endpoints
  static const Api api = Api();

  /// Storage keys
  static const StorageKeys storageKeys = StorageKeys();

  /// Error messages
  static const ErrorMessages errorMessages = ErrorMessages();

  /// RTL constants
  static const RTL rtl = RTL();

  /// Font settings
  static const FontSettings fontSettings = FontSettings();
}

/// Route names
class Routes {
  /// Constructor
  const Routes();

  /// Splash route
  final String splash = '/';

  /// Login route
  final String login = '/login';

  /// Register route
  final String register = '/register';

  /// Forgot password route
  final String forgotPassword = '/forgot-password';

  /// Home route
  final String home = '/home';

  /// Dashboard route
  final String dashboard = '/home/dashboard';

  /// Customers route
  final String customers = '/home/customers';

  /// Customer detail route
  final String customerDetail = '/home/customers/:id';

  /// Transactions route
  final String transactions = '/home/transactions';

  /// Transaction detail route
  final String transactionDetail = '/home/transactions/:id';

  /// Reports route
  final String reports = '/home/reports';

  /// Settings route
  final String settings = '/home/settings';

  /// Profile route
  final String profile = '/home/profile';

  /// Privacy policy route
  final String privacyPolicy = '/privacy-policy';

  /// Terms route
  final String terms = '/terms';
}

/// Asset paths
class Assets {
  /// Constructor
  const Assets();

  /// Images path
  final String images = 'assets/images/';

  /// Icons path
  final String icons = 'assets/icons/';

  /// Fonts path
  final String fonts = 'assets/fonts/';
}

/// API endpoints
class Api {
  /// Constructor
  const Api();

  /// Login endpoint
  final String login = '/auth/login';

  /// Register endpoint
  final String register = '/auth/register';

  /// Forgot password endpoint
  final String forgotPassword = '/auth/forgot-password';

  /// Reset password endpoint
  final String resetPassword = '/auth/reset-password';

  /// Customers endpoint
  final String customers = '/customers';

  /// Transactions endpoint
  final String transactions = '/transactions';

  /// Reports endpoint
  final String reports = '/reports';
}

/// Storage keys
class StorageKeys {
  /// Constructor
  const StorageKeys();

  /// Token key
  final String token = 'token';

  /// User key
  final String user = 'user';

  /// Theme key
  final String theme = 'theme';

  /// Language key
  final String language = 'language';

  /// Direction key
  final String direction = 'direction';

  /// First time key
  final String firstTime = 'first_time';

  /// Language code key
  final String languageCode = 'language_code';

  /// Font family key
  final String fontFamily = 'font_family';

  /// Font size key
  final String fontSize = 'font_size';

  /// Country key
  final String country = 'country';

  /// RTL key
  final String isRTL = 'is_rtl';
}

/// Error messages
class ErrorMessages {
  /// Constructor
  const ErrorMessages();

  /// No internet error
  final String noInternet = 'No internet connection';

  /// Server error
  final String server = 'Server error';

  /// Unknown error
  final String unknown = 'Unknown error';

  /// Invalid credentials error
  final String invalidCredentials = 'Invalid credentials';

  /// Invalid email error
  final String invalidEmail = 'Invalid email';

  /// Invalid password error
  final String invalidPassword = 'Invalid password';

  /// Invalid phone error
  final String invalidPhone = 'Invalid phone number';

  /// Invalid name error
  final String invalidName = 'Invalid name';

  /// Invalid amount error
  final String invalidAmount = 'Invalid amount';

  /// Invalid date error
  final String invalidDate = 'Invalid date';

  /// Invalid note error
  final String invalidNote = 'Invalid note';

  /// Invalid image error
  final String invalidImage = 'Invalid image';

  /// Invalid voice error
  final String invalidVoice = 'Invalid voice note';
}

/// RTL constants
class RTL {
  /// Constructor
  const RTL();

  /// Left to right text
  final String leftToRight = 'Left to Right';

  /// Right to left text
  final String rightToLeft = 'Right to Left';

  /// Direction text
  final String direction = 'Text Direction';

  /// Description text
  final String description = 'Change the text direction of the app';

  /// RTL languages
  static const List<String> languages = [
    'ar', // Arabic
    'he', // Hebrew
    'fa', // Persian
    'ur', // Urdu
  ];
}

/// Font settings
class FontSettings {
  /// Constructor
  const FontSettings();

  /// Available font families
  static const List<String> availableFonts = [
    'Roboto',
    'Lato',
    'OpenSans',
    'Poppins',
    'Montserrat',
  ];

  /// Minimum font size multiplier
  final double minFontSize = 0.8;

  /// Maximum font size multiplier
  final double maxFontSize = 1.4;

  /// Default font size multiplier
  final double defaultFontSize = 1.0;
}
