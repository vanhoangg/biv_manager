import '../../../data/models/customer_dto.dart';
import '../../entities/customer_entity.dart';
import '../../repositories/customer_repository.dart';

/// Use case for creating a customer
class CreateCustomerUseCase {
  /// Customer repository
  final CustomerRepository _repository;

  /// Constructor
  CreateCustomerUseCase(this._repository);

  /// Execute the use case
  Future<CustomerEntity> call(CustomerEntity customer) async {
    final dto = CustomerDTO(
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
    final createdCustomer = await _repository.createCustomer(dto);
    return CustomerEntity(
      id: createdCustomer.id,
      name: createdCustomer.name,
      email: createdCustomer.email,
      phone: createdCustomer.phone,
      address: createdCustomer.address,
      type: createdCustomer.type,
      status: createdCustomer.status,
      createdAt: createdCustomer.createdAt,
      updatedAt: createdCustomer.updatedAt,
      notes: createdCustomer.notes,
    );
  }
}
