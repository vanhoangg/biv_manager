import '../entities/transaction_entity.dart';
import '../../core/result.dart';

/// Repository interface for transaction operations
abstract class TransactionRepository {
  /// Get all transactions
  Future<Result<List<TransactionEntity>>> getTransactions();

  /// Get a transaction by ID
  Future<Result<TransactionEntity>> getTransactionById(String id);

  /// Create a new transaction
  Future<Result<TransactionEntity>> createTransaction(
      TransactionEntity transaction);

  /// Update an existing transaction
  Future<Result<TransactionEntity>> updateTransaction(
      TransactionEntity transaction);

  /// Delete a transaction
  Future<Result<void>> deleteTransaction(String id);

  /// Get transactions by date range
  Future<Result<List<TransactionEntity>>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  /// Get transactions by customer
  Future<Result<List<TransactionEntity>>> getTransactionsByCustomer(
      String customerId);

  /// Get total amount by date range
  Future<Result<double>> getTotalAmountByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  /// Get total amount by customer
  Future<Result<double>> getTotalAmountByCustomer(String customerId);
}
