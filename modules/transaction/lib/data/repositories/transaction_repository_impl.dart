import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/error/failures.dart';
import 'package:core/result.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction/transaction_local_data_source.dart';
import '../datasources/transaction/transaction_remote_data_source.dart';
import '../models/transaction_dto.dart';

/// Implementation of TransactionRepository using Firebase
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSource _localDataSource;
  final TransactionRemoteDataSource _remoteDataSource;

  /// Constructor
  TransactionRepositoryImpl({
    required FirebaseFirestore firestore,
    required TransactionLocalDataSource localDataSource,
    required TransactionRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<Result<List<TransactionEntity>>> getTransactions() async {
    try {
      final transactions = await _remoteDataSource.getTransactions();
      await _localDataSource.cacheTransactions(transactions);
      return Result.success(transactions);
    } on ServerFailure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<TransactionEntity>> getTransactionById(String id) async {
    try {
      final transaction = await _remoteDataSource.getTransactionById(id);
      return Result.success(transaction);
    } on ServerFailure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<TransactionEntity>> createTransaction(
    TransactionEntity transaction,
  ) async {
    try {
      final createdTransaction = await _remoteDataSource.createTransaction(
        TransactionDTO.fromEntity(transaction),
      );
      return Result.success(createdTransaction);
    } on ServerFailure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<TransactionEntity>> updateTransaction(
    TransactionEntity transaction,
  ) async {
    try {
      final updatedTransaction = await _remoteDataSource.updateTransaction(
        TransactionDTO.fromEntity(transaction),
      );
      return Result.success(updatedTransaction);
    } on ServerFailure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteTransaction(String id) async {
    try {
      await _remoteDataSource.deleteTransaction(id);
      return Result.success(null);
    } on ServerFailure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<TransactionEntity>>> getTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final transactions = await _remoteDataSource.getTransactionsByDateRange(
        startDate,
        endDate,
      );
      return Result.success(transactions);
    } on ServerFailure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<List<TransactionEntity>>> getTransactionsByCustomer(
    String customerId,
  ) async {
    try {
      final transactions = await _remoteDataSource.getTransactionsByCustomer(
        customerId,
      );
      return Result.success(transactions);
    } on ServerFailure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<double>> getTotalAmountByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final transactions = await _remoteDataSource.getTransactionsByDateRange(
        startDate,
        endDate,
      );
      final total = transactions.fold<double>(
        0,
        (totalAmount, transaction) => totalAmount + transaction.amount,
      );
      return Result.success(total);
    } on ServerFailure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Result<double>> getTotalAmountByCustomer(String customerId) async {
    try {
      final transactions = await _remoteDataSource.getTransactionsByCustomer(
        customerId,
      );
      final total = transactions.fold<double>(
        0,
        (totalAmount, transaction) => totalAmount + transaction.amount,
      );
      return Result.success(total);
    } on ServerFailure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }
}
