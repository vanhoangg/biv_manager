import 'package:biv_manager/core/config/firebase_config.dart';

/// EnvVariables provides access to environment variables for the app.
class EnvVariables {
  static String get currentFirebaseApiKey =>
      const String.fromEnvironment('FIREBASE_API_KEY', defaultValue: '');
  static String get currentFirebaseAppId =>
      const String.fromEnvironment('FIREBASE_APP_ID', defaultValue: '');
  static String get currentFirebaseProjectId =>
      const String.fromEnvironment('FIREBASE_PROJECT_ID', defaultValue: '');
  static String get currentFirebaseMessagingSenderId =>
      const String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID',
          defaultValue: '');
  static String get currentFirebaseAuthDomain =>
      const String.fromEnvironment('FIREBASE_AUTH_DOMAIN', defaultValue: '');
  static String get currentFirebaseStorageBucket =>
      const String.fromEnvironment('FIREBASE_STORAGE_BUCKET', defaultValue: '');
  static String get currentApiKey =>
      const String.fromEnvironment('API_KEY', defaultValue: '');
  static String get currentBaseUrl =>
      const String.fromEnvironment('BASE_URL', defaultValue: '');
  static String get backdoorEmail =>
      const String.fromEnvironment('BACKDOOR_EMAIL', defaultValue: '');
  static String get backdoorPassword =>
      const String.fromEnvironment('BACKDOOR_PASSWORD', defaultValue: '');

  /// Get current Firebase configuration
  static FirebaseConfig get currentFirebaseConfig => FirebaseConfig(
        apiKey: currentFirebaseApiKey,
        appId: currentFirebaseAppId,
        projectId: currentFirebaseProjectId,
        messagingSenderId: currentFirebaseMessagingSenderId,
        authDomain: currentFirebaseAuthDomain,
        storageBucket: currentFirebaseStorageBucket,
      );
}
