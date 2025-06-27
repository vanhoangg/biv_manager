import 'package:equatable/equatable.dart';
import '../../../domain/entities/transaction_entity.dart';

/// Base class for transaction states
abstract class TransactionState extends Equatable {
  /// Constructor
  const TransactionState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class TransactionInitial extends TransactionState {
  const TransactionInitial();
}

/// Loading state
class TransactionLoading extends TransactionState {
  const TransactionLoading();
}

/// Loaded state with transactions
class TransactionsLoaded extends TransactionState {
  /// List of transactions
  final List<TransactionEntity> transactions;

  /// Constructor
  const TransactionsLoaded(this.transactions);

  @override
  List<Object?> get props => [transactions];
}

/// Loaded state with a single transaction
class TransactionLoaded extends TransactionState {
  /// Transaction
  final TransactionEntity transaction;

  /// Constructor
  const TransactionLoaded(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

/// Created state
class TransactionCreated extends TransactionState {
  final TransactionEntity transaction;

  const TransactionCreated(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

/// Updated state
class TransactionUpdated extends TransactionState {
  final TransactionEntity transaction;

  const TransactionUpdated(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

/// Deleted state
class TransactionDeleted extends TransactionState {
  const TransactionDeleted();
}

/// Total amount loaded state
class TotalAmountLoaded extends TransactionState {
  /// Total amount
  final double amount;

  /// Constructor
  const TotalAmountLoaded(this.amount);

  @override
  List<Object?> get props => [amount];
}

/// Error state
class TransactionError extends TransactionState {
  /// Error message
  final String message;

  /// Constructor
  const TransactionError(this.message);

  @override
  List<Object?> get props => [message];
}
