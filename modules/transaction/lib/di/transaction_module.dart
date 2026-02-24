import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasources/transaction/transaction_local_data_source.dart';
import '../data/datasources/transaction/transaction_remote_data_source.dart';
import '../data/repositories/transaction_repository_impl.dart';
import '../domain/repositories/transaction_repository.dart';
import '../domain/usecases/transaction/create_transaction_usecase.dart';
import '../domain/usecases/transaction/delete_transaction_usecase.dart';
import '../domain/usecases/transaction/get_total_amount_by_customer_usecase.dart';
import '../domain/usecases/transaction/get_total_amount_by_date_range_usecase.dart';
import '../domain/usecases/transaction/get_transaction_by_id_usecase.dart';
import '../domain/usecases/transaction/get_transactions_by_customer_usecase.dart';
import '../domain/usecases/transaction/get_transactions_by_date_range_usecase.dart';
import '../domain/usecases/transaction/get_transactions_usecase.dart';
import '../domain/usecases/transaction/update_transaction_usecase.dart';
import '../presentation/blocs/transaction/transaction_bloc.dart';

/// Registers transaction module dependencies into a shared service locator.
void registerTransactionModule(GetIt sl) {
  sl.registerLazySingleton<TransactionLocalDataSource>(
    () => TransactionLocalDataSourceImpl(sharedPreferences: sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<TransactionRemoteDataSource>(
    () => TransactionRemoteDataSourceImpl(firestore: sl<FirebaseFirestore>()),
  );
  sl.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(
      firestore: sl<FirebaseFirestore>(),
      localDataSource: sl<TransactionLocalDataSource>(),
      remoteDataSource: sl<TransactionRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton(() => GetTransactionsUseCase(sl<TransactionRepository>()));
  sl.registerLazySingleton(
    () => GetTransactionByIdUseCase(sl<TransactionRepository>()),
  );
  sl.registerLazySingleton(
    () => CreateTransactionUseCase(sl<TransactionRepository>()),
  );
  sl.registerLazySingleton(
    () => UpdateTransactionUseCase(sl<TransactionRepository>()),
  );
  sl.registerLazySingleton(
    () => DeleteTransactionUseCase(sl<TransactionRepository>()),
  );
  sl.registerLazySingleton(
    () => GetTransactionsByDateRangeUseCase(sl<TransactionRepository>()),
  );
  sl.registerLazySingleton(
    () => GetTransactionsByCustomerUseCase(sl<TransactionRepository>()),
  );
  sl.registerLazySingleton(
    () => GetTotalAmountByDateRangeUseCase(sl<TransactionRepository>()),
  );
  sl.registerLazySingleton(
    () => GetTotalAmountByCustomerUseCase(sl<TransactionRepository>()),
  );

  sl.registerFactory(
    () => TransactionBloc(
      getTransactionsUseCase: sl<GetTransactionsUseCase>(),
      getTransactionByIdUseCase: sl<GetTransactionByIdUseCase>(),
      createTransactionUseCase: sl<CreateTransactionUseCase>(),
      updateTransactionUseCase: sl<UpdateTransactionUseCase>(),
      deleteTransactionUseCase: sl<DeleteTransactionUseCase>(),
      getTransactionsByDateRangeUseCase: sl<GetTransactionsByDateRangeUseCase>(),
      getTransactionsByCustomerUseCase: sl<GetTransactionsByCustomerUseCase>(),
      getTotalAmountByDateRangeUseCase: sl<GetTotalAmountByDateRangeUseCase>(),
      getTotalAmountByCustomerUseCase: sl<GetTotalAmountByCustomerUseCase>(),
    ),
  );
}
