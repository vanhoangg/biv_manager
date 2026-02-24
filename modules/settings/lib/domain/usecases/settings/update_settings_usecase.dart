import 'package:core/result.dart';
import 'package:core/usecases/usecase.dart';
import '../../entities/settings_entity.dart';
import '../../repositories/settings_repository.dart';

/// Use case for updating settings
class UpdateSettingsUseCase implements UseCase<void, SettingsEntity> {
  final SettingsRepository _repository;

  const UpdateSettingsUseCase(this._repository);

  @override
  Future<Result<void>> call(SettingsEntity params) async {
    return await _repository.updateSettings(params);
  }
}
