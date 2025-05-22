import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../shared/index.dart';

import '../../../domain/entities/transaction_entity.dart' as domain;

/// Transaction remote data source
abstract class TransactionRemoteDataSource {
  /// Get all transactions
  Future<List<domain.TransactionEntity>> getTransactions();

  /// Get transaction by ID
  Future<domain.TransactionEntity> getTransaction(String id);

  /// Create transaction
  Future<domain.TransactionEntity> createTransaction(
      domain.TransactionEntity transaction);

  /// Update transaction
  Future<domain.TransactionEntity> updateTransaction(
      domain.TransactionEntity transaction);

  /// Delete transaction
  Future<void> deleteTransaction(String id);
}

/// Transaction remote data source implementation
class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  /// Firestore instance
  final FirebaseFirestore firestore;

  /// Collection name
  static const String _collection = 'transactions';

  /// Constructor
  TransactionRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<domain.TransactionEntity>> getTransactions() async {
    try {
      final snapshot = await firestore.collection(_collection).get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return domain.TransactionEntity(
          id: doc.id,
          title: data['title'] as String,
          amount: (data['amount'] as num).toDouble(),
          date: (data['date'] as Timestamp).toDate(),
          status: data['status'] as String,
          description: data['description'] as String?,
          type: data['type'] as String,
          category: data['category'] as String,
        );
      }).toList();
    } catch (e) {
      throw ServerException('Failed to get transactions: ${e.toString()}');
    }
  }

  @override
  Future<domain.TransactionEntity> getTransaction(String id) async {
    try {
      final doc = await firestore.collection(_collection).doc(id).get();
      if (!doc.exists) {
        throw ServerException('Transaction not found');
      }
      final data = doc.data()!;
      return domain.TransactionEntity(
        id: doc.id,
        title: data['title'] as String,
        amount: (data['amount'] as num).toDouble(),
        date: (data['date'] as Timestamp).toDate(),
        status: data['status'] as String,
        description: data['description'] as String?,
        type: data['type'] as String,
        category: data['category'] as String,
      );
    } catch (e) {
      throw ServerException('Failed to get transaction: ${e.toString()}');
    }
  }

  @override
  Future<domain.TransactionEntity> createTransaction(
      domain.TransactionEntity transaction) async {
    try {
      final doc = await firestore.collection(_collection).add({
        'title': transaction.title,
        'amount': transaction.amount,
        'date': Timestamp.fromDate(transaction.date),
        'status': transaction.status,
        'description': transaction.description,
        'type': transaction.type,
        'category': transaction.category,
      });
      return transaction.copyWith(id: doc.id);
    } catch (e) {
      throw ServerException('Failed to create transaction: ${e.toString()}');
    }
  }

  @override
  Future<domain.TransactionEntity> updateTransaction(
      domain.TransactionEntity transaction) async {
    try {
      await firestore.collection(_collection).doc(transaction.id).update({
        'title': transaction.title,
        'amount': transaction.amount,
        'date': Timestamp.fromDate(transaction.date),
        'status': transaction.status,
        'description': transaction.description,
        'type': transaction.type,
        'category': transaction.category,
      });
      return transaction;
    } catch (e) {
      throw ServerException('Failed to update transaction: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteTransaction(String id) async {
    try {
      await firestore.collection(_collection).doc(id).delete();
    } catch (e) {
      throw ServerException('Failed to delete transaction: ${e.toString()}');
    }
  }
}
