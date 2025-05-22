import '../../../../core/result.dart';
import '../../entities/settings_entity.dart';
import '../../repositories/settings_repository.dart';

/// Use case for getting application settings
class GetSettingsUseCase {
  final SettingsRepository _repository;

  /// Constructor
  GetSettingsUseCase(this._repository);

  /// Execute the use case
  Future<Result<SettingsEntity>> call() async {
    try {
      final settings = await _repository.getSettings();
      return Result.ok(settings);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
