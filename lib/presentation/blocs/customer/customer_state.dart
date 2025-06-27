import 'package:equatable/equatable.dart';
import '../../../domain/entities/customer_entity.dart';

/// Base class for customer states
abstract class CustomerState extends Equatable {
  /// Constructor
  const CustomerState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class CustomerInitial extends CustomerState {
  /// Constructor
  const CustomerInitial();
}

/// Loading state
class CustomerLoading extends CustomerState {
  /// Constructor
  const CustomerLoading();
}

/// Loaded state
class CustomerLoaded extends CustomerState {
  /// List of customers
  final List<CustomerEntity> customers;

  /// Constructor
  const CustomerLoaded(this.customers);

  @override
  List<Object?> get props => [customers];
}

/// Error state
class CustomerError extends CustomerState {
  /// Error message
  final String message;

  /// Constructor
  const CustomerError(this.message);

  @override
  List<Object?> get props => [message];
}
