import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/settings/settings_local_data_source.dart';
import '../../data/datasources/settings/settings_remote_data_source.dart';
import '../../data/datasources/transaction/transaction_local_data_source.dart';
import '../../data/datasources/transaction/transaction_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../data/repositories/customer_repository_impl.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/usecases/auth/reset_password_usecase.dart';
import '../../domain/usecases/auth/sign_in_usecase.dart';
import '../../domain/usecases/auth/sign_up_usecase.dart';
import '../../domain/usecases/settings/get_settings_usecase.dart';
import '../../domain/usecases/settings/update_settings_usecase.dart';
import '../../domain/usecases/customer/get_customers_usecase.dart';
import '../../domain/usecases/customer/get_customer_by_id_usecase.dart';
import '../../domain/usecases/customer/create_customer_usecase.dart';
import '../../domain/usecases/customer/update_customer_usecase.dart';
import '../../domain/usecases/customer/delete_customer_usecase.dart';
import '../../domain/usecases/customer/search_customers_usecase.dart';
import '../../domain/usecases/customer/get_customers_by_status_usecase.dart';
import '../../domain/usecases/customer/get_customers_by_type_usecase.dart';
import '../../domain/usecases/transaction/get_transactions_usecase.dart';
import '../../domain/usecases/transaction/get_transaction_by_id_usecase.dart';
import '../../domain/usecases/transaction/create_transaction_usecase.dart';
import '../../domain/usecases/transaction/update_transaction_usecase.dart';
import '../../domain/usecases/transaction/delete_transaction_usecase.dart';
import '../../domain/usecases/transaction/get_transactions_by_date_range_usecase.dart';
import '../../domain/usecases/transaction/get_transactions_by_customer_usecase.dart';
import '../../domain/usecases/transaction/get_total_amount_by_date_range_usecase.dart';
import '../../domain/usecases/transaction/get_total_amount_by_customer_usecase.dart';
import '../../presentation/blocs/auth/auth_bloc.dart';
import '../../presentation/blocs/settings/settings_bloc.dart';
import '../../presentation/blocs/customer/customer_bloc.dart';
import '../../presentation/blocs/transaction/transaction_bloc.dart';
import '../../shared/index.dart';

/// Service locator instance
final GetIt sl = GetIt.instance;

/// Initialize dependency injection container
/// Manually registers all dependencies without code generation
Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  final remoteConfig = FirebaseRemoteConfig.instance;
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => remoteConfig);

  // App constants
  sl.registerLazySingleton(() => AppConstants());

  // Firebase services
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Theme
  sl.registerLazySingleton(() => ThemeManager(sl()));

  // Localization
  sl.registerLazySingleton(() => LocalizationService());

  // RTL
  sl.registerLazySingleton(() => RTLService(sl()));

  // Data sources
  sl.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSource(sl()),
  );
  sl.registerLazySingleton<TransactionLocalDataSource>(
    () => TransactionLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<TransactionRemoteDataSource>(
    () => TransactionRemoteDataSourceImpl(
      firestore: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      firestore: sl(),
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<CustomerRepository>(
    () => CustomerRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(
      firestore: sl(),
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignUpUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => GetSettingsUseCase(sl<SettingsRepository>()));
  sl.registerLazySingleton(
      () => UpdateSettingsUseCase(sl<SettingsRepository>()));

  // Customer use cases
  sl.registerLazySingleton(() => GetCustomersUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(
      () => GetCustomerByIdUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(
      () => CreateCustomerUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(
      () => UpdateCustomerUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(
      () => DeleteCustomerUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(
      () => SearchCustomersUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(
      () => GetCustomersByStatusUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(
      () => GetCustomersByTypeUseCase(sl<CustomerRepository>()));

  // Transaction use cases
  sl.registerLazySingleton(
      () => GetTransactionsUseCase(sl<TransactionRepository>()));
  sl.registerLazySingleton(
      () => GetTransactionByIdUseCase(sl<TransactionRepository>()));
  sl.registerLazySingleton(
      () => CreateTransactionUseCase(sl<TransactionRepository>()));
  sl.registerLazySingleton(
      () => UpdateTransactionUseCase(sl<TransactionRepository>()));
  sl.registerLazySingleton(
      () => DeleteTransactionUseCase(sl<TransactionRepository>()));
  sl.registerLazySingleton(
      () => GetTransactionsByDateRangeUseCase(sl<TransactionRepository>()));
  sl.registerLazySingleton(
      () => GetTransactionsByCustomerUseCase(sl<TransactionRepository>()));
  sl.registerLazySingleton(
      () => GetTotalAmountByDateRangeUseCase(sl<TransactionRepository>()));
  sl.registerLazySingleton(
      () => GetTotalAmountByCustomerUseCase(sl<TransactionRepository>()));

  // Blocs
  sl.registerFactory(
    () => AuthBloc(
      signInUseCase: sl(),
      signUpUseCase: sl(),
      resetPasswordUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => SettingsBloc(
      getSettingsUseCase: sl(),
      updateSettingsUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => CustomerBloc(
      getCustomersUseCase: sl(),
      getCustomerByIdUseCase: sl(),
      createCustomerUseCase: sl(),
      updateCustomerUseCase: sl(),
      deleteCustomerUseCase: sl(),
      searchCustomersUseCase: sl(),
      getCustomersByStatusUseCase: sl(),
      getCustomersByTypeUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => TransactionBloc(
      getTransactionsUseCase: sl(),
      getTransactionByIdUseCase: sl(),
      createTransactionUseCase: sl(),
      updateTransactionUseCase: sl(),
      deleteTransactionUseCase: sl(),
      getTransactionsByDateRangeUseCase: sl(),
      getTransactionsByCustomerUseCase: sl(),
      getTotalAmountByDateRangeUseCase: sl(),
      getTotalAmountByCustomerUseCase: sl(),
    ),
  );
}
