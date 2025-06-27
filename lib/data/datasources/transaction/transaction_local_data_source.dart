import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/transaction_entity.dart' as domain;
import '../../models/transaction_dto.dart';

/// Transaction local data source
abstract class TransactionLocalDataSource {
  /// Get transactions
  Future<List<TransactionDTO>> getTransactions();

  /// Get transaction by ID
  Future<TransactionDTO?> getTransactionById(String id);

  /// Create transaction
  Future<void> createTransaction(domain.TransactionEntity transaction);

  /// Update transaction
  Future<void> updateTransaction(domain.TransactionEntity transaction);

  /// Delete transaction
  Future<void> deleteTransaction(String id);

  /// Get transactions by date range
  Future<List<TransactionDTO>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  /// Get transactions by customer
  Future<List<TransactionDTO>> getTransactionsByCustomer(String customerId);

  /// Get total amount by date range
  Future<double> getTotalAmountByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  /// Get total amount by customer
  Future<double> getTotalAmountByCustomer(String customerId);

  /// Cache transactions
  Future<void> cacheTransactions(List<domain.TransactionEntity> transactions);

  /// Get cached transactions
  Future<List<domain.TransactionEntity>> getCachedTransactions();

  /// Clear cached transactions
  Future<void> clearCachedTransactions();
}

/// Transaction local data source implementation
class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  /// Shared preferences instance
  final SharedPreferences _sharedPreferences;

  /// Transactions key
  static const String _transactionsKey = 'CACHED_TRANSACTIONS';

  /// Constructor
  TransactionLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<List<TransactionDTO>> getTransactions() async {
    // TODO: Implement local storage
    return [];
  }

  @override
  Future<TransactionDTO?> getTransactionById(String id) async {
    // TODO: Implement local storage
    return null;
  }

  @override
  Future<void> createTransaction(domain.TransactionEntity transaction) async {
    // TODO: Implement local storage
  }

  @override
  Future<void> updateTransaction(domain.TransactionEntity transaction) async {
    // TODO: Implement local storage
  }

  @override
  Future<void> deleteTransaction(String id) async {
    // TODO: Implement local storage
  }

  @override
  Future<List<TransactionDTO>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    // TODO: Implement local storage
    return [];
  }

  @override
  Future<List<TransactionDTO>> getTransactionsByCustomer(
    String customerId,
  ) async {
    // TODO: Implement local storage
    return [];
  }

  @override
  Future<double> getTotalAmountByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    // TODO: Implement local storage
    return 0.0;
  }

  @override
  Future<double> getTotalAmountByCustomer(String customerId) async {
    // TODO: Implement local storage
    return 0.0;
  }

  @override
  Future<void> cacheTransactions(
      List<domain.TransactionEntity> transactions) async {
    final transactionsJson = transactions
        .map((transaction) => jsonEncode(transaction.toJson()))
        .toList();
    await _sharedPreferences.setStringList(_transactionsKey, transactionsJson);
  }

  @override
  Future<List<domain.TransactionEntity>> getCachedTransactions() async {
    final transactionsJson = _sharedPreferences.getStringList(_transactionsKey);
    if (transactionsJson == null) {
      return [];
    }
    return transactionsJson
        .map((json) => domain.TransactionEntity.fromJson(jsonDecode(json)))
        .toList();
  }

  @override
  Future<void> clearCachedTransactions() async {
    await _sharedPreferences.remove(_transactionsKey);
  }
}
