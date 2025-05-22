import '../../firebase_options.dart';
import 'firebase_config.dart';

/// EnvVariables provides access to environment variables for the app.
class EnvVariables {
  static String get currentFirebaseApiKey =>
      DefaultFirebaseOptions.currentPlatform.apiKey;
  static String get currentFirebaseAppId =>
      DefaultFirebaseOptions.currentPlatform.appId;
  static String get currentFirebaseProjectId =>
      DefaultFirebaseOptions.currentPlatform.projectId;
  static String get currentFirebaseMessagingSenderId =>
      DefaultFirebaseOptions.currentPlatform.messagingSenderId;
  static String get currentFirebaseAuthDomain =>
      DefaultFirebaseOptions.currentPlatform.authDomain ?? '';
  static String get currentFirebaseStorageBucket =>
      DefaultFirebaseOptions.currentPlatform.storageBucket ?? '';
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
