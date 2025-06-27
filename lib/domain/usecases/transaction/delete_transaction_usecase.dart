import '../../repositories/transaction_repository.dart';

/// Use case for deleting a transaction
class DeleteTransactionUseCase {
  /// Transaction repository
  final TransactionRepository _transactionRepository;

  /// Constructor
  DeleteTransactionUseCase(this._transactionRepository);

  /// Delete transaction
  Future<void> call(String id) async {
    try {
      await _transactionRepository.deleteTransaction(id);
    } catch (e) {
      throw Exception('Failed to delete transaction: $e');
    }
  }
}
