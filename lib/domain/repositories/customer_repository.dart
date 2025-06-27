import '../../data/models/customer_dto.dart';

/// Repository interface for customer operations
abstract class CustomerRepository {
  /// Get all customers
  Future<List<CustomerDTO>> getCustomers();

  /// Get customer by ID
  Future<CustomerDTO> getCustomerById(String id);

  /// Create new customer
  Future<CustomerDTO> createCustomer(CustomerDTO customer);

  /// Update customer
  Future<CustomerDTO> updateCustomer(CustomerDTO customer);

  /// Delete customer
  Future<void> deleteCustomer(String id);

  /// Search customers
  Future<List<CustomerDTO>> searchCustomers(String query);

  /// Get customers by status
  Future<List<CustomerDTO>> getCustomersByStatus(String status);

  /// Get customers by type
  Future<List<CustomerDTO>> getCustomersByType(String type);
}
