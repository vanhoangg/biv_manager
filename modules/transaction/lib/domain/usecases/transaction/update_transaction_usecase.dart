import 'package:core/result.dart';
import 'package:core/usecases/usecase.dart';
import '../../entities/transaction_entity.dart';
import '../../repositories/transaction_repository.dart';

/// Use case for updating a transaction
class UpdateTransactionUseCase
    implements UseCase<TransactionEntity, TransactionEntity> {
  /// Transaction repository
  final TransactionRepository repository;

  /// Constructor
  UpdateTransactionUseCase(this.repository);

  @override
  Future<Result<TransactionEntity>> call(TransactionEntity params) async {
    return await repository.updateTransaction(params);
  }
}
