/// Auth user entity
class AuthUserEntity {
  /// User ID
  final String id;

  /// User email
  final String email;

  /// User display name
  final String? displayName;

  /// User photo URL
  final String? photoUrl;

  /// User photo URL
  final String? accessToken;

  /// Constructor
  const AuthUserEntity({
    required this.id,
    required this.email,
    required this.accessToken,
    this.displayName,
    this.photoUrl,
  });
}
