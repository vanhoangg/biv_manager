import 'package:core/result.dart';
import 'package:core/usecases/usecase.dart';
import '../../entities/transaction_entity.dart';
import '../../repositories/transaction_repository.dart';

/// Use case for getting all transactions
class GetTransactionsUseCase
    implements UseCase<List<TransactionEntity>, NoParams> {
  /// Transaction repository
  final TransactionRepository repository;

  /// Constructor
  GetTransactionsUseCase(this.repository);

  @override
  Future<Result<List<TransactionEntity>>> call(NoParams params) async {
    return await repository.getTransactions();
  }
}
