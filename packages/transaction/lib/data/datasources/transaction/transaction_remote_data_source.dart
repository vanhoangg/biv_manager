import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/error/failures.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../models/transaction_dto.dart';

/// Transaction remote data source
abstract class TransactionRemoteDataSource {
  /// Get all transactions
  Future<List<TransactionEntity>> getTransactions();

  /// Get a transaction by ID
  Future<TransactionEntity> getTransactionById(String id);

  /// Create a new transaction
  Future<TransactionEntity> createTransaction(TransactionDTO transaction);

  /// Update an existing transaction
  Future<TransactionEntity> updateTransaction(TransactionDTO transaction);

  /// Delete a transaction
  Future<void> deleteTransaction(String id);

  /// Get transactions by date range
  Future<List<TransactionEntity>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  /// Get transactions by customer
  Future<List<TransactionEntity>> getTransactionsByCustomer(String customerId);

  /// Get total amount by date range
  Future<double> getTotalAmountByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  /// Get total amount by customer
  Future<double> getTotalAmountByCustomer(String customerId);
}

/// Transaction remote data source implementation
class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  /// Firestore instance
  final FirebaseFirestore _firestore;

  /// Collection name
  static const String _collection = 'transactions';

  /// Constructor
  TransactionRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    try {
      final snapshot = await _firestore.collection(_collection).get();
      return snapshot.docs
          .map((doc) => TransactionEntity.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<TransactionEntity> getTransactionById(String id) async {
    try {
      final doc = await _firestore.collection(_collection).doc(id).get();
      if (!doc.exists) {
        throw NotFoundFailure();
      }
      return TransactionEntity.fromJson(doc.data()!);
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<TransactionEntity> createTransaction(
      TransactionDTO transaction) async {
    try {
      final docRef =
          await _firestore.collection(_collection).add(transaction.toJson());
      final doc = await docRef.get();
      return TransactionEntity.fromJson(doc.data()!);
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<TransactionEntity> updateTransaction(
      TransactionDTO transaction) async {
    try {
      await _firestore
          .collection(_collection)
          .doc(transaction.id)
          .update(transaction.toJson());
      final doc =
          await _firestore.collection(_collection).doc(transaction.id).get();
      return TransactionEntity.fromJson(doc.data()!);
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<void> deleteTransaction(String id) async {
    try {
      await _firestore.collection(_collection).doc(id).delete();
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final snapshot = await _firestore
          .collection(_collection)
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate))
          .where('date', isLessThanOrEqualTo: Timestamp.fromDate(endDate))
          .get();
      return snapshot.docs
          .map((doc) => TransactionEntity.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactionsByCustomer(
    String customerId,
  ) async {
    try {
      final snapshot = await _firestore
          .collection(_collection)
          .where('customerId', isEqualTo: customerId)
          .get();
      return snapshot.docs
          .map((doc) => TransactionEntity.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<double> getTotalAmountByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final transactions = await getTransactionsByDateRange(startDate, endDate);
    return transactions.fold<double>(
      0.0,
      (totalAmount, transaction) => totalAmount + transaction.amount,
    );
  }

  @override
  Future<double> getTotalAmountByCustomer(String customerId) async {
    final transactions = await getTransactionsByCustomer(customerId);
    return transactions.fold<double>(
      0.0,
      (totalAmount, transaction) => totalAmount + transaction.amount,
    );
  }
}
