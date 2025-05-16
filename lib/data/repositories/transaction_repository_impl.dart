import 'package:biv_manager/domain/entities/transaction.dart';
import 'package:biv_manager/domain/repositories/transaction_repository.dart';
import 'package:biv_manager/core/error/exceptions.dart';
import 'package:biv_manager/core/error/failures.dart';
import 'package:biv_manager/core/network/network_info.dart';
import 'package:biv_manager/data/datasources/transaction_remote_data_source.dart';
import 'package:biv_manager/data/datasources/transaction_local_data_source.dart';
import 'package:dartz/dartz.dart';

/// Transaction repository implementation
class TransactionRepositoryImpl implements TransactionRepository {
  /// Remote data source
  final TransactionRemoteDataSource remoteDataSource;

  /// Local data source
  final TransactionLocalDataSource localDataSource;

  /// Network info
  final NetworkInfo networkInfo;

  /// Constructor
  TransactionRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Transaction>> getTransactions() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTransactions = await remoteDataSource.getTransactions();
        await localDataSource.cacheTransactions(remoteTransactions);
        return remoteTransactions;
      } on ServerException {
        return localDataSource.getLastTransactions();
      }
    } else {
      return localDataSource.getLastTransactions();
    }
  }

  @override
  Future<Transaction> getTransaction(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTransaction = await remoteDataSource.getTransaction(id);
        await localDataSource.cacheTransaction(remoteTransaction);
        return remoteTransaction;
      } on ServerException {
        return localDataSource.getLastTransaction(id);
      }
    } else {
      return localDataSource.getLastTransaction(id);
    }
  }

  @override
  Future<Transaction> createTransaction(Transaction transaction) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTransaction =
            await remoteDataSource.createTransaction(transaction);
        await localDataSource.cacheTransaction(remoteTransaction);
        return remoteTransaction;
      } on ServerException catch (e) {
        throw ServerFailure(e.message);
      }
    } else {
      throw NetworkFailure();
    }
  }

  @override
  Future<Transaction> updateTransaction(Transaction transaction) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTransaction =
            await remoteDataSource.updateTransaction(transaction);
        await localDataSource.cacheTransaction(remoteTransaction);
        return remoteTransaction;
      } on ServerException catch (e) {
        throw ServerFailure(e.message);
      }
    } else {
      throw NetworkFailure();
    }
  }

  @override
  Future<void> deleteTransaction(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteTransaction(id);
        await localDataSource.deleteTransaction(id);
      } on ServerException catch (e) {
        throw ServerFailure(e.message);
      }
    } else {
      throw NetworkFailure();
    }
  }
}
