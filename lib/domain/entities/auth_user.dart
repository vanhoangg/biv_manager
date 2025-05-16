/// Auth user entity
class AuthUser {
  /// User ID
  final String id;

  /// User email
  final String email;

  /// User display name
  final String? displayName;

  /// User photo URL
  final String? photoUrl;

  /// Constructor
  const AuthUser({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
  });
}
