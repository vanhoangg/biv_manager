import '../../../core/result.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/transaction_entity.dart';
import '../../repositories/transaction_repository.dart';

/// Use case for getting a transaction by ID
class GetTransactionByIdUseCase implements UseCase<TransactionEntity, String> {
  /// Transaction repository
  final TransactionRepository repository;

  /// Constructor
  GetTransactionByIdUseCase(this.repository);

  @override
  Future<Result<TransactionEntity>> call(String params) async {
    return await repository.getTransactionById(params);
  }
}
