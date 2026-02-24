/// Utility class that simplifies handling errors.
///
/// Return a [Result] from a function to indicate success or failure.
///
/// A [Result] is either an [Ok] with a value of type [T]
/// or an [Error] with an [Exception].
///
/// Use [Result.ok] to create a successful result with a value of type [T].
/// Use [Result.error] to create an error result with an [Exception].
///
/// Evaluate the result using a switch statement:
/// ```dart
/// switch (result) {
///   case Ok(): {
///     print(result.value);
///   }
///   case Error(): {
///     print(result.error);
///   }
/// }
/// ```
library;

import 'package:equatable/equatable.dart';
import 'error/failures.dart';

/// A class that represents either a success or a failure.
sealed class Result<T> extends Equatable {
  const Result();

  /// Creates a success result with the given value.
  factory Result.success(T value) => Ok(value);

  /// Creates a failure result with the given failure.
  factory Result.failure(Failure failure) => Error(failure);

  /// Returns true if this result is a success.
  bool get isSuccess => this is Ok<T>;

  /// Returns true if this result is a failure.
  bool get isFailure => this is Error<T>;

  /// Folds this result into a value of type R.
  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Failure failure) onFailure,
  }) {
    return switch (this) {
      Ok(value: final value) => onSuccess(value),
      Error(error: final error) => onFailure(error),
    };
  }
}

/// A successful [Result] with a returned [value].
final class Ok<T> extends Result<T> {
  const Ok(this.value);

  /// The returned value of this result.
  final T value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'Result<$T>.ok($value)';
}

/// An error [Result] with a resulting [error].
final class Error<T> extends Result<T> {
  const Error(this.error);

  /// The resulting error of this result.
  final Failure error;

  @override
  List<Object?> get props => [error];

  @override
  String toString() => 'Result<$T>.error($error)';
}
