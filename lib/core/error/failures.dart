/// Base class for all failures
abstract class Failure {
  /// Error message
  final String message;

  /// Constructor
  const Failure(this.message);

  @override
  String toString() => message;
}

/// Server failure
class ServerFailure extends Failure {
  /// Constructor
  const ServerFailure([String? message])
      : super(message ?? 'Server error occurred');
}

/// Cache failure
class CacheFailure extends Failure {
  /// Constructor
  const CacheFailure([String? message])
      : super(message ?? 'Cache error occurred');
}

/// Network failure
class NetworkFailure extends Failure {
  /// Constructor
  const NetworkFailure([String? message])
      : super(message ?? 'Network error occurred');
}

/// Not found failure
class NotFoundFailure extends Failure {
  /// Constructor
  const NotFoundFailure([String? message])
      : super(message ?? 'Resource not found');
}

/// Invalid input failure
class InvalidInputFailure extends Failure {
  /// Constructor
  const InvalidInputFailure([String? message])
      : super(message ?? 'Invalid input');
}

/// Authentication failure
class AuthFailure extends Failure {
  /// Constructor
  const AuthFailure([String? message])
      : super(message ?? 'Authentication failed');
}

/// Permission failure
class PermissionFailure extends Failure {
  /// Constructor
  const PermissionFailure([String? message])
      : super(message ?? 'Permission denied');
}

/// Timeout failure
class TimeoutFailure extends Failure {
  /// Constructor
  const TimeoutFailure([String? message])
      : super(message ?? 'Operation timed out');
}

/// Unknown failure
class UnknownFailure extends Failure {
  /// Constructor
  const UnknownFailure([String? message])
      : super(message ?? 'Unknown error occurred');
}
