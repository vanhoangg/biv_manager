import 'package:core/result.dart';
import 'package:core/usecases/usecase.dart';
import '../../repositories/transaction_repository.dart';

/// Use case for getting total amount by customer
class GetTotalAmountByCustomerUseCase implements UseCase<double, String> {
  final TransactionRepository _repository;

  const GetTotalAmountByCustomerUseCase(this._repository);

  @override
  Future<Result<double>> call(String customerId) async {
    return await _repository.getTotalAmountByCustomer(customerId);
  }
}
