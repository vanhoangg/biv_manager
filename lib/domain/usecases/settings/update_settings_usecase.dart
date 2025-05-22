import '../../../../core/result.dart';
import '../../entities/settings_entity.dart';
import '../../repositories/settings_repository.dart';

/// Use case for updating application settings
class UpdateSettingsUseCase {
  final SettingsRepository _repository;

  /// Constructor
  UpdateSettingsUseCase(this._repository);

  /// Execute the use case
  Future<Result<SettingsEntity>> call(SettingsEntity settings) async {
    try {
      final updatedSettings = await _repository.updateSettings(settings);
      if (updatedSettings != null) {
        return Result.ok(updatedSettings);
      }
      return Result.error(Exception('Failed to update settings'));
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
