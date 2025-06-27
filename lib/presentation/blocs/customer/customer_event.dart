import 'package:equatable/equatable.dart';
import '../../../domain/entities/customer_entity.dart';

/// Base class for customer events
abstract class CustomerEvent extends Equatable {
  /// Constructor
  const CustomerEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all customers
class LoadCustomers extends CustomerEvent {
  /// Constructor
  const LoadCustomers();
}

/// Event to load a single customer by ID
class LoadCustomerById extends CustomerEvent {
  /// Customer ID
  final String id;

  /// Constructor
  const LoadCustomerById(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to create a new customer
class CreateCustomer extends CustomerEvent {
  /// Customer data
  final CustomerEntity customer;

  /// Constructor
  const CreateCustomer(this.customer);

  @override
  List<Object?> get props => [customer];
}

/// Event to update an existing customer
class UpdateCustomer extends CustomerEvent {
  /// Customer data
  final CustomerEntity customer;

  /// Constructor
  const UpdateCustomer(this.customer);

  @override
  List<Object?> get props => [customer];
}

/// Event to delete a customer
class DeleteCustomer extends CustomerEvent {
  /// Customer ID
  final String id;

  /// Constructor
  const DeleteCustomer(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to search customers
class SearchCustomers extends CustomerEvent {
  /// Search query
  final String query;

  /// Constructor
  const SearchCustomers(this.query);

  @override
  List<Object?> get props => [query];
}

/// Event to filter customers by status
class FilterCustomersByStatus extends CustomerEvent {
  /// Status to filter by
  final String status;

  /// Constructor
  const FilterCustomersByStatus(this.status);

  @override
  List<Object?> get props => [status];
}

/// Event to filter customers by type
class FilterCustomersByType extends CustomerEvent {
  /// Type to filter by
  final String type;

  /// Constructor
  const FilterCustomersByType(this.type);

  @override
  List<Object?> get props => [type];
}
