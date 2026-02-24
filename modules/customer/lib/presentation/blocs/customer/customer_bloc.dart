import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/customer/create_customer_usecase.dart';
import '../../../domain/usecases/customer/delete_customer_usecase.dart';
import '../../../domain/usecases/customer/get_customer_by_id_usecase.dart';
import '../../../domain/usecases/customer/get_customers_by_status_usecase.dart';
import '../../../domain/usecases/customer/get_customers_by_type_usecase.dart';
import '../../../domain/usecases/customer/get_customers_usecase.dart';
import '../../../domain/usecases/customer/search_customers_usecase.dart';
import '../../../domain/usecases/customer/update_customer_usecase.dart';
import 'customer_event.dart';
import 'customer_state.dart';

/// BLoC for customer management
class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  /// Get customers use case
  final GetCustomersUseCase _getCustomersUseCase;

  /// Get customer by ID use case
  final GetCustomerByIdUseCase _getCustomerByIdUseCase;

  /// Create customer use case
  final CreateCustomerUseCase _createCustomerUseCase;

  /// Update customer use case
  final UpdateCustomerUseCase _updateCustomerUseCase;

  /// Delete customer use case
  final DeleteCustomerUseCase _deleteCustomerUseCase;

  /// Search customers use case
  final SearchCustomersUseCase _searchCustomersUseCase;

  /// Get customers by status use case
  final GetCustomersByStatusUseCase _getCustomersByStatusUseCase;

  /// Get customers by type use case
  final GetCustomersByTypeUseCase _getCustomersByTypeUseCase;

  /// Constructor
  CustomerBloc({
    required GetCustomersUseCase getCustomersUseCase,
    required GetCustomerByIdUseCase getCustomerByIdUseCase,
    required CreateCustomerUseCase createCustomerUseCase,
    required UpdateCustomerUseCase updateCustomerUseCase,
    required DeleteCustomerUseCase deleteCustomerUseCase,
    required SearchCustomersUseCase searchCustomersUseCase,
    required GetCustomersByStatusUseCase getCustomersByStatusUseCase,
    required GetCustomersByTypeUseCase getCustomersByTypeUseCase,
  })  : _getCustomersUseCase = getCustomersUseCase,
        _getCustomerByIdUseCase = getCustomerByIdUseCase,
        _createCustomerUseCase = createCustomerUseCase,
        _updateCustomerUseCase = updateCustomerUseCase,
        _deleteCustomerUseCase = deleteCustomerUseCase,
        _searchCustomersUseCase = searchCustomersUseCase,
        _getCustomersByStatusUseCase = getCustomersByStatusUseCase,
        _getCustomersByTypeUseCase = getCustomersByTypeUseCase,
        super(const CustomerInitial()) {
    on<LoadCustomers>(_onLoadCustomers);
    on<LoadCustomerById>(_onLoadCustomerById);
    on<CreateCustomer>(_onCreateCustomer);
    on<UpdateCustomer>(_onUpdateCustomer);
    on<DeleteCustomer>(_onDeleteCustomer);
    on<SearchCustomers>(_onSearchCustomers);
    on<FilterCustomersByStatus>(_onFilterCustomersByStatus);
    on<FilterCustomersByType>(_onFilterCustomersByType);
  }

  Future<void> _onLoadCustomers(
    LoadCustomers event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(const CustomerLoading());
      final customers = await _getCustomersUseCase();
      emit(CustomerLoaded(customers));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _onLoadCustomerById(
    LoadCustomerById event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(const CustomerLoading());
      final customer = await _getCustomerByIdUseCase(event.id);
      emit(CustomerLoaded([customer]));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _onCreateCustomer(
    CreateCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(const CustomerLoading());
      await _createCustomerUseCase(event.customer);
      final customers = await _getCustomersUseCase();
      emit(CustomerLoaded(customers));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _onUpdateCustomer(
    UpdateCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(const CustomerLoading());
      await _updateCustomerUseCase(event.customer);
      final customers = await _getCustomersUseCase();
      emit(CustomerLoaded(customers));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _onDeleteCustomer(
    DeleteCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(const CustomerLoading());
      await _deleteCustomerUseCase(event.id);
      final customers = await _getCustomersUseCase();
      emit(CustomerLoaded(customers));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _onSearchCustomers(
    SearchCustomers event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(const CustomerLoading());
      final customers = await _searchCustomersUseCase(event.query);
      emit(CustomerLoaded(customers));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _onFilterCustomersByStatus(
    FilterCustomersByStatus event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(const CustomerLoading());
      final customers = await _getCustomersByStatusUseCase(event.status);
      emit(CustomerLoaded(customers));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _onFilterCustomersByType(
    FilterCustomersByType event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      emit(const CustomerLoading());
      final customers = await _getCustomersByTypeUseCase(event.type);
      emit(CustomerLoaded(customers));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }
}
