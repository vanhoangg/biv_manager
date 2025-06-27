import '../../entities/customer_entity.dart';
import '../../repositories/customer_repository.dart';

/// Use case for getting all customers
class GetCustomersUseCase {
  /// Customer repository
  final CustomerRepository _repository;

  /// Constructor
  GetCustomersUseCase(this._repository);

  /// Execute the use case
  Future<List<CustomerEntity>> call() async {
    final customers = await _repository.getCustomers();
    return customers
        .map((dto) => CustomerEntity(
              id: dto.id,
              name: dto.name,
              email: dto.email,
              phone: dto.phone,
              address: dto.address,
              type: dto.type,
              status: dto.status,
              createdAt: dto.createdAt,
              updatedAt: dto.updatedAt,
              notes: dto.notes,
            ))
        .toList();
  }
}
