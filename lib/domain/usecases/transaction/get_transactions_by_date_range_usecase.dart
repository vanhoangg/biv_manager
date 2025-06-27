import '../../../core/usecases/usecase.dart';
import '../../../core/result.dart';
import '../../entities/transaction_entity.dart';
import '../../repositories/transaction_repository.dart';

/// Use case for getting transactions by date range
class GetTransactionsByDateRangeUseCase
    implements UseCase<List<TransactionEntity>, DateRangeParams> {
  final TransactionRepository _repository;

  const GetTransactionsByDateRangeUseCase(this._repository);

  @override
  Future<Result<List<TransactionEntity>>> call(DateRangeParams params) async {
    return await _repository.getTransactionsByDateRange(
      params.startDate,
      params.endDate,
    );
  }
}
