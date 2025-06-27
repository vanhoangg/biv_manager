import 'package:equatable/equatable.dart';
import '../../../domain/entities/transaction_entity.dart';

/// Base class for transaction events
abstract class TransactionEvent extends Equatable {
  /// Constructor
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all transactions
class LoadTransactions extends TransactionEvent {
  /// Constructor
  const LoadTransactions();
}

/// Event to get all transactions
class GetTransactions extends TransactionEvent {
  /// Constructor
  const GetTransactions();
}

/// Event to load a transaction by ID
class GetTransactionById extends TransactionEvent {
  /// Transaction ID
  final String id;

  /// Constructor
  const GetTransactionById(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to create a transaction
class CreateTransaction extends TransactionEvent {
  /// Transaction data
  final TransactionEntity transaction;

  /// Constructor
  const CreateTransaction(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

/// Event to update a transaction
class UpdateTransaction extends TransactionEvent {
  /// Transaction data
  final TransactionEntity transaction;

  /// Constructor
  const UpdateTransaction(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

/// Event to delete a transaction
class DeleteTransaction extends TransactionEvent {
  /// Transaction ID
  final String id;

  /// Constructor
  const DeleteTransaction(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to get transactions by date range
class GetTransactionsByDateRange extends TransactionEvent {
  /// Start date
  final DateTime startDate;

  /// End date
  final DateTime endDate;

  /// Constructor
  const GetTransactionsByDateRange({
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [startDate, endDate];
}

/// Event to get transactions by customer
class GetTransactionsByCustomer extends TransactionEvent {
  /// Customer ID
  final String customerId;

  /// Constructor
  const GetTransactionsByCustomer(this.customerId);

  @override
  List<Object?> get props => [customerId];
}

/// Event to get total amount by date range
class GetTotalAmountByDateRange extends TransactionEvent {
  /// Start date
  final DateTime startDate;

  /// End date
  final DateTime endDate;

  /// Constructor
  const GetTotalAmountByDateRange({
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [startDate, endDate];
}

/// Event to get total amount by customer
class GetTotalAmountByCustomer extends TransactionEvent {
  /// Customer ID
  final String customerId;

  /// Constructor
  const GetTotalAmountByCustomer(this.customerId);

  @override
  List<Object?> get props => [customerId];
}
