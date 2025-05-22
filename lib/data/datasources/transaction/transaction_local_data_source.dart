import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/transaction_entity.dart' as domain;
import '../../../shared/index.dart';

/// Transaction local data source
abstract class TransactionLocalDataSource {
  /// Get last transactions
  Future<List<domain.TransactionEntity>> getLastTransactions();

  /// Get last transaction
  Future<domain.TransactionEntity> getLastTransaction(String id);

  /// Cache transactions
  Future<void> cacheTransactions(List<domain.TransactionEntity> transactions);

  /// Cache transaction
  Future<void> cacheTransaction(domain.TransactionEntity transaction);

  /// Delete transaction
  Future<void> deleteTransaction(String id);
}

/// Transaction local data source implementation
class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  /// Shared preferences instance
  final SharedPreferences sharedPreferences;

  /// Transactions key
  static const String _transactionsKey = 'CACHED_TRANSACTIONS';

  /// Constructor
  TransactionLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<List<domain.TransactionEntity>> getLastTransactions() async {
    final jsonString = sharedPreferences.getString(_transactionsKey);
    if (jsonString == null) {
      throw CacheException('No cached transactions found');
    }
    try {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) => domain.TransactionEntity(
                id: json['id'] as String,
                title: json['title'] as String,
                amount: (json['amount'] as num).toDouble(),
                date: DateTime.parse(json['date'] as String),
                status: json['status'] as String,
                description: json['description'] as String?,
                type: json['type'] as String,
                category: json['category'] as String,
              ))
          .toList();
    } catch (e) {
      throw CacheException(
          'Failed to parse cached transactions: ${e.toString()}');
    }
  }

  @override
  Future<domain.TransactionEntity> getLastTransaction(String id) async {
    final transactions = await getLastTransactions();
    try {
      return transactions.firstWhere((transaction) => transaction.id == id);
    } catch (e) {
      throw CacheException('Transaction not found in cache');
    }
  }

  @override
  Future<void> cacheTransactions(
      List<domain.TransactionEntity> transactions) async {
    final jsonList = transactions
        .map((transaction) => {
              'id': transaction.id,
              'title': transaction.title,
              'amount': transaction.amount,
              'date': transaction.date.toIso8601String(),
              'status': transaction.status,
              'description': transaction.description,
              'type': transaction.type,
              'category': transaction.category,
            })
        .toList();
    try {
      await sharedPreferences.setString(
          _transactionsKey, json.encode(jsonList));
    } catch (e) {
      throw CacheException('Failed to cache transactions: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheTransaction(domain.TransactionEntity transaction) async {
    try {
      final transactions = await getLastTransactions();
      final index = transactions.indexWhere((t) => t.id == transaction.id);
      if (index >= 0) {
        transactions[index] = transaction;
      } else {
        transactions.add(transaction);
      }
      await cacheTransactions(transactions);
    } catch (e) {
      throw CacheException('Failed to cache transaction: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteTransaction(String id) async {
    try {
      final transactions = await getLastTransactions();
      transactions.removeWhere((transaction) => transaction.id == id);
      await cacheTransactions(transactions);
    } catch (e) {
      throw CacheException(
          'Failed to delete transaction from cache: ${e.toString()}');
    }
  }
}
