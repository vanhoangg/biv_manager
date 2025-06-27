import '../../repositories/customer_repository.dart';

/// Use case for deleting a customer
class DeleteCustomerUseCase {
  /// Customer repository
  final CustomerRepository _repository;

  /// Constructor
  DeleteCustomerUseCase(this._repository);

  /// Execute the use case
  Future<void> call(String id) async {
    await _repository.deleteCustomer(id);
  }
}
