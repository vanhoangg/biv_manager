/// States for authentication
abstract class AuthState {}

/// Initial state
class AuthInitial extends AuthState {}

/// Loading state
class AuthLoading extends AuthState {}

/// Success state
class AuthSuccess extends AuthState {}

/// Error state
class AuthError extends AuthState {
  /// Error message
  final String message;

  /// Constructor
  AuthError({required this.message});
}
