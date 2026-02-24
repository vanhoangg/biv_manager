import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../../domain/usecases/transaction/create_transaction_usecase.dart';
import '../../../domain/usecases/transaction/delete_transaction_usecase.dart';
import '../../../domain/usecases/transaction/get_total_amount_by_customer_usecase.dart';
import '../../../domain/usecases/transaction/get_total_amount_by_date_range_usecase.dart';
import '../../../domain/usecases/transaction/get_transaction_by_id_usecase.dart';
import '../../../domain/usecases/transaction/get_transactions_by_customer_usecase.dart';
import '../../../domain/usecases/transaction/get_transactions_by_date_range_usecase.dart';
import '../../../domain/usecases/transaction/get_transactions_usecase.dart';
import '../../../domain/usecases/transaction/update_transaction_usecase.dart';
import 'package:core/usecases/usecase.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

/// Bloc for managing transactions
class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  /// Use case for getting all transactions
  final GetTransactionsUseCase _getTransactionsUseCase;

  /// Use case for getting a transaction by ID
  final GetTransactionByIdUseCase _getTransactionByIdUseCase;

  /// Use case for creating a transaction
  final CreateTransactionUseCase _createTransactionUseCase;

  /// Use case for updating a transaction
  final UpdateTransactionUseCase _updateTransactionUseCase;

  /// Use case for deleting a transaction
  final DeleteTransactionUseCase _deleteTransactionUseCase;

  /// Use case for getting transactions by date range
  final GetTransactionsByDateRangeUseCase _getTransactionsByDateRangeUseCase;

  /// Use case for getting transactions by customer
  final GetTransactionsByCustomerUseCase _getTransactionsByCustomerUseCase;

  /// Use case for getting total amount by date range
  final GetTotalAmountByDateRangeUseCase _getTotalAmountByDateRangeUseCase;

  /// Use case for getting total amount by customer
  final GetTotalAmountByCustomerUseCase _getTotalAmountByCustomerUseCase;

  /// Constructor
  TransactionBloc({
    required GetTransactionsUseCase getTransactionsUseCase,
    required GetTransactionByIdUseCase getTransactionByIdUseCase,
    required CreateTransactionUseCase createTransactionUseCase,
    required UpdateTransactionUseCase updateTransactionUseCase,
    required DeleteTransactionUseCase deleteTransactionUseCase,
    required GetTransactionsByDateRangeUseCase
        getTransactionsByDateRangeUseCase,
    required GetTransactionsByCustomerUseCase getTransactionsByCustomerUseCase,
    required GetTotalAmountByDateRangeUseCase getTotalAmountByDateRangeUseCase,
    required GetTotalAmountByCustomerUseCase getTotalAmountByCustomerUseCase,
  })  : _getTransactionsUseCase = getTransactionsUseCase,
        _getTransactionByIdUseCase = getTransactionByIdUseCase,
        _createTransactionUseCase = createTransactionUseCase,
        _updateTransactionUseCase = updateTransactionUseCase,
        _deleteTransactionUseCase = deleteTransactionUseCase,
        _getTransactionsByDateRangeUseCase = getTransactionsByDateRangeUseCase,
        _getTransactionsByCustomerUseCase = getTransactionsByCustomerUseCase,
        _getTotalAmountByDateRangeUseCase = getTotalAmountByDateRangeUseCase,
        _getTotalAmountByCustomerUseCase = getTotalAmountByCustomerUseCase,
        super(const TransactionInitial()) {
    on<LoadTransactions>(_onLoadTransactions);
    on<GetTransactionById>(_onGetTransactionById);
    on<CreateTransaction>(_onCreateTransaction);
    on<UpdateTransaction>(_onUpdateTransaction);
    on<DeleteTransaction>(_onDeleteTransaction);
    on<GetTransactionsByDateRange>(_onGetTransactionsByDateRange);
    on<GetTransactionsByCustomer>(_onGetTransactionsByCustomer);
    on<GetTotalAmountByDateRange>(_onGetTotalAmountByDateRange);
    on<GetTotalAmountByCustomer>(_onGetTotalAmountByCustomer);
  }

  Future<void> _onLoadTransactions(
    LoadTransactions event,
    Emitter<TransactionState> emit,
  ) async {
    emit(const TransactionLoading());
    final result = await _getTransactionsUseCase(const NoParams());
    result.fold(
      onSuccess: (transactions) => emit(TransactionsLoaded(transactions)),
      onFailure: (failure) => emit(TransactionError(failure.message)),
    );
  }

  Future<void> _onGetTransactionById(
    GetTransactionById event,
    Emitter<TransactionState> emit,
  ) async {
    emit(const TransactionLoading());
    final result = await _getTransactionByIdUseCase(event.id);
    result.fold(
      onSuccess: (transaction) => emit(TransactionLoaded(transaction)),
      onFailure: (failure) => emit(TransactionError(failure.message)),
    );
  }

  Future<void> _onCreateTransaction(
    CreateTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    emit(const TransactionLoading());
    final result = await _createTransactionUseCase(event.transaction);
    result.fold(
      onSuccess: (transaction) => emit(TransactionCreated(transaction)),
      onFailure: (failure) => emit(TransactionError(failure.message)),
    );
  }

  Future<void> _onUpdateTransaction(
    UpdateTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    emit(const TransactionLoading());
    final result = await _updateTransactionUseCase(event.transaction);
    result.fold(
      onSuccess: (transaction) => emit(TransactionUpdated(transaction)),
      onFailure: (failure) => emit(TransactionError(failure.message)),
    );
  }

  Future<void> _onDeleteTransaction(
    DeleteTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    emit(const TransactionLoading());
    await _deleteTransactionUseCase(event.id);
    emit(const TransactionDeleted());
  }

  Future<void> _onGetTransactionsByDateRange(
    GetTransactionsByDateRange event,
    Emitter<TransactionState> emit,
  ) async {
    emit(const TransactionLoading());
    final result = await _getTransactionsByDateRangeUseCase(
      DateRangeParams(
        startDate: event.startDate,
        endDate: event.endDate,
      ),
    );
    result.fold(
      onSuccess: (transactions) => emit(TransactionsLoaded(transactions)),
      onFailure: (failure) => emit(TransactionError(failure.message)),
    );
  }

  Future<void> _onGetTransactionsByCustomer(
    GetTransactionsByCustomer event,
    Emitter<TransactionState> emit,
  ) async {
    emit(const TransactionLoading());
    final result = await _getTransactionsByCustomerUseCase(event.customerId);
    result.fold(
      onSuccess: (transactions) => emit(TransactionsLoaded(transactions)),
      onFailure: (failure) => emit(TransactionError(failure.message)),
    );
  }

  Future<void> _onGetTotalAmountByDateRange(
    GetTotalAmountByDateRange event,
    Emitter<TransactionState> emit,
  ) async {
    emit(const TransactionLoading());
    final result = await _getTotalAmountByDateRangeUseCase(
      DateRangeParams(
        startDate: event.startDate,
        endDate: event.endDate,
      ),
    );
    result.fold(
      onSuccess: (amount) => emit(TotalAmountLoaded(amount)),
      onFailure: (failure) => emit(TransactionError(failure.message)),
    );
  }

  Future<void> _onGetTotalAmountByCustomer(
    GetTotalAmountByCustomer event,
    Emitter<TransactionState> emit,
  ) async {
    emit(const TransactionLoading());
    final result = await _getTotalAmountByCustomerUseCase(event.customerId);
    result.fold(
      onSuccess: (amount) => emit(TotalAmountLoaded(amount)),
      onFailure: (failure) => emit(TransactionError(failure.message)),
    );
  }
}
