import '../../../core/usecases/usecase.dart';
import '../../../core/result.dart';
import '../../../core/error/failures.dart';
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
