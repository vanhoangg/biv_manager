/// Events for authentication
abstract class AuthEvent {}

/// Event for login request
class LoginRequested extends AuthEvent {
  /// Email for login
  final String email;

  /// Password for login
  final String password;

  /// Constructor
  LoginRequested({required this.email, required this.password});
}

/// Event for register request
class RegisterRequested extends AuthEvent {
  /// Email for registration
  final String email;

  /// Password for registration
  final String password;

  /// Constructor
  RegisterRequested({required this.email, required this.password});
}

/// Event for forgot password request
class ForgotPasswordRequested extends AuthEvent {
  /// Email for password reset
  final String email;

  /// Constructor
  ForgotPasswordRequested({required this.email});
}
