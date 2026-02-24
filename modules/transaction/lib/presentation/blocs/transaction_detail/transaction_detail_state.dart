import 'package:equatable/equatable.dart';

import '../../../domain/entities/transaction_entity.dart';

/// Transaction detail states
abstract class TransactionDetailState extends Equatable {
  /// Constructor
  const TransactionDetailState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class TransactionDetailInitial extends TransactionDetailState {
  /// Constructor
  const TransactionDetailInitial();
}

/// Loading state
class TransactionDetailLoading extends TransactionDetailState {
  /// Constructor
  const TransactionDetailLoading();
}

/// Loaded state
class TransactionDetailLoaded extends TransactionDetailState {
  /// Transaction
  final TransactionEntity transaction;

  /// Constructor
  const TransactionDetailLoaded(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

/// Error state
class TransactionDetailError extends TransactionDetailState {
  /// Error message
  final String message;

  /// Constructor
  const TransactionDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
