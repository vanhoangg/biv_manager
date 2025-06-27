import '../../entities/customer_entity.dart';
import '../../repositories/customer_repository.dart';

/// Use case for getting a customer by ID
class GetCustomerByIdUseCase {
  /// Customer repository
  final CustomerRepository _repository;

  /// Constructor
  GetCustomerByIdUseCase(this._repository);

  /// Execute the use case
  Future<CustomerEntity> call(String id) async {
    final customer = await _repository.getCustomerById(id);
    return CustomerEntity(
      id: customer.id,
      name: customer.name,
      email: customer.email,
      phone: customer.phone,
      address: customer.address,
      type: customer.type,
      status: customer.status,
      createdAt: customer.createdAt,
      updatedAt: customer.updatedAt,
      notes: customer.notes,
    );
  }
}
