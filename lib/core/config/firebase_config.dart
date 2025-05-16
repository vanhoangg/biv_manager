/// Firebase configuration class
class FirebaseConfig {
  /// Firebase API key
  final String apiKey;

  /// Firebase app ID
  final String appId;

  /// Firebase project ID
  final String projectId;

  /// Firebase messaging sender ID
  final String messagingSenderId;

  /// Firebase auth domain
  final String authDomain;

  /// Firebase storage bucket
  final String storageBucket;

  const FirebaseConfig({
    required this.apiKey,
    required this.appId,
    required this.projectId,
    required this.messagingSenderId,
    required this.authDomain,
    required this.storageBucket,
  });
}
