import 'package:biv_manager/domain/entities/transaction.dart';

/// Transaction repository interface
abstract class TransactionRepository {
  /// Get all transactions
  Future<List<Transaction>> getTransactions();

  /// Get transaction by ID
  Future<Transaction> getTransaction(String id);

  /// Create transaction
  Future<Transaction> createTransaction(Transaction transaction);

  /// Update transaction
  Future<Transaction> updateTransaction(Transaction transaction);

  /// Delete transaction
  Future<void> deleteTransaction(String id);
}
