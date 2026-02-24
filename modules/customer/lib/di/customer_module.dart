import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/customer_repository_impl.dart';
import '../domain/repositories/customer_repository.dart';
import '../domain/usecases/customer/create_customer_usecase.dart';
import '../domain/usecases/customer/delete_customer_usecase.dart';
import '../domain/usecases/customer/get_customer_by_id_usecase.dart';
import '../domain/usecases/customer/get_customers_by_status_usecase.dart';
import '../domain/usecases/customer/get_customers_by_type_usecase.dart';
import '../domain/usecases/customer/get_customers_usecase.dart';
import '../domain/usecases/customer/search_customers_usecase.dart';
import '../domain/usecases/customer/update_customer_usecase.dart';
import '../presentation/blocs/customer/customer_bloc.dart';

/// Registers customer module dependencies into a shared service locator.
void registerCustomerModule(GetIt sl) {
  sl.registerLazySingleton<CustomerRepository>(
    () => CustomerRepositoryImpl(sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton(() => GetCustomersUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(() => GetCustomerByIdUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(() => CreateCustomerUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(() => UpdateCustomerUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(() => DeleteCustomerUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(() => SearchCustomersUseCase(sl<CustomerRepository>()));
  sl.registerLazySingleton(
    () => GetCustomersByStatusUseCase(sl<CustomerRepository>()),
  );
  sl.registerLazySingleton(
    () => GetCustomersByTypeUseCase(sl<CustomerRepository>()),
  );

  sl.registerFactory(
    () => CustomerBloc(
      getCustomersUseCase: sl<GetCustomersUseCase>(),
      getCustomerByIdUseCase: sl<GetCustomerByIdUseCase>(),
      createCustomerUseCase: sl<CreateCustomerUseCase>(),
      updateCustomerUseCase: sl<UpdateCustomerUseCase>(),
      deleteCustomerUseCase: sl<DeleteCustomerUseCase>(),
      searchCustomersUseCase: sl<SearchCustomersUseCase>(),
      getCustomersByStatusUseCase: sl<GetCustomersByStatusUseCase>(),
      getCustomersByTypeUseCase: sl<GetCustomersByTypeUseCase>(),
    ),
  );
}
