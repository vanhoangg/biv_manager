import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../shared/index.dart';
import '../datasources/transaction/transaction_local_data_source.dart';
import '../datasources/transaction/transaction_remote_data_source.dart';

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
  Future<List<TransactionEntity>> getTransactions() async {
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
  Future<TransactionEntity> getTransaction(String id) async {
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
  Future<TransactionEntity> createTransaction(
      TransactionEntity transaction) async {
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
      throw const NetworkFailure();
    }
  }

  @override
  Future<TransactionEntity> updateTransaction(
      TransactionEntity transaction) async {
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
      throw const NetworkFailure();
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
      throw const NetworkFailure();
    }
  }
}
