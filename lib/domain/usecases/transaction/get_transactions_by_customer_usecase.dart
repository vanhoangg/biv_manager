import '../../../core/usecases/usecase.dart';
import '../../../core/result.dart';
import '../../entities/transaction_entity.dart';
import '../../repositories/transaction_repository.dart';

/// Use case for getting transactions by customer
class GetTransactionsByCustomerUseCase
    implements UseCase<List<TransactionEntity>, String> {
  final TransactionRepository _repository;

  const GetTransactionsByCustomerUseCase(this._repository);

  @override
  Future<Result<List<TransactionEntity>>> call(String customerId) async {
    return await _repository.getTransactionsByCustomer(customerId);
  }
}
