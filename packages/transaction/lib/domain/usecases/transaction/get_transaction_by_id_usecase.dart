import 'package:core/result.dart';
import 'package:core/error/failures.dart';
import 'package:core/usecases/usecase.dart';
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
