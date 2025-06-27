import '../../../core/usecases/usecase.dart';
import '../../../core/result.dart';
import '../../../core/error/failures.dart';
import '../../entities/settings_entity.dart';
import '../../repositories/settings_repository.dart';

/// Use case for getting application settings
class GetSettingsUseCase implements UseCase<SettingsEntity, NoParams> {
  final SettingsRepository _repository;

  /// Constructor
  const GetSettingsUseCase(this._repository);

  /// Execute the use case
  @override
  Future<Result<SettingsEntity>> call(NoParams params) async {
    try {
      final result = await _repository.getSettings();
      return result;
    } catch (e) {
      return Result.failure(ServerFailure(e.toString()));
    }
  }
}
