import 'package:equatable/equatable.dart';

/// Base failure class
abstract class Failure extends Equatable {
  /// Constructor
  const Failure();

  @override
  List<Object?> get props => [];
}

/// Server failure
class ServerFailure extends Failure {
  /// Error message
  final String message;

  /// Constructor
  const ServerFailure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Network failure
class NetworkFailure extends Failure {
  /// Constructor
  const NetworkFailure();
}

/// Cache failure
class CacheFailure extends Failure {
  /// Error message
  final String message;

  /// Constructor
  const CacheFailure(this.message);

  @override
  List<Object?> get props => [message];
}
