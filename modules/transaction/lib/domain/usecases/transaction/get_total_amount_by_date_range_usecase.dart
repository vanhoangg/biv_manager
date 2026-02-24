import 'package:core/result.dart';
import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
import '../../repositories/transaction_repository.dart';

/// Use case for getting total amount by date range
class GetTotalAmountByDateRangeUseCase
    implements UseCase<double, DateRangeParams> {
  final TransactionRepository _repository;

  const GetTotalAmountByDateRangeUseCase(this._repository);

  @override
  Future<Result<double>> call(DateRangeParams params) async {
    try {
      return await _repository.getTotalAmountByDateRange(
        params.startDate,
        params.endDate,
      );
    } catch (e) {
      return Result.failure(ServerFailure(e.toString()));
    }
  }
}
