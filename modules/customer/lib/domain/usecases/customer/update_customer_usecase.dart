import '../../../data/models/customer_dto.dart';
import '../../entities/customer_entity.dart';
import '../../repositories/customer_repository.dart';

/// Use case for updating a customer
class UpdateCustomerUseCase {
  /// Customer repository
  final CustomerRepository _repository;

  /// Constructor
  UpdateCustomerUseCase(this._repository);

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
    final updatedCustomer = await _repository.updateCustomer(dto);
    return CustomerEntity(
      id: updatedCustomer.id,
      name: updatedCustomer.name,
      email: updatedCustomer.email,
      phone: updatedCustomer.phone,
      address: updatedCustomer.address,
      type: updatedCustomer.type,
      status: updatedCustomer.status,
      createdAt: updatedCustomer.createdAt,
      updatedAt: updatedCustomer.updatedAt,
      notes: updatedCustomer.notes,
    );
  }
}
