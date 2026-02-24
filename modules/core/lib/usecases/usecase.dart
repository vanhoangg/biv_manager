import '../result.dart';

/// Base class for all use cases
abstract class UseCase<Type, Params> {
  /// Call the use case with the given parameters
  Future<Result<Type>> call(Params params);
}

/// No parameters for use cases that don't require parameters
class NoParams {
  /// Constructor
  const NoParams();
}

/// Class for use cases that require date range parameters
class DateRangeParams {
  final DateTime startDate;
  final DateTime endDate;

  const DateRangeParams({
    required this.startDate,
    required this.endDate,
  });
}
