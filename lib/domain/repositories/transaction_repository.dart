import '../entities/transaction_entity.dart';

/// Transaction repository interface
abstract class TransactionRepository {
  /// Get all transactions
  Future<List<TransactionEntity>> getTransactions();

  /// Get transaction by ID
  Future<TransactionEntity> getTransaction(String id);

  /// Create transaction
  Future<TransactionEntity> createTransaction(TransactionEntity transaction);

  /// Update transaction
  Future<TransactionEntity> updateTransaction(TransactionEntity transaction);

  /// Delete transaction
  Future<void> deleteTransaction(String id);
}
