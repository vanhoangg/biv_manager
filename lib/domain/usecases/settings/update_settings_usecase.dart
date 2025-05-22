import 'package:dartz/dartz.dart';

import '../../entities/settings_entity.dart';
import '../../repositories/settings_repository.dart';

/// Use case for updating application settings
class UpdateSettingsUseCase {
  final SettingsRepository _repository;

  /// Constructor
  UpdateSettingsUseCase(this._repository);

  /// Execute the use case
  Future<Either<Exception, SettingsEntity>> call(
      SettingsEntity settings) async {
    try {
      final updatedSettings = await _repository.updateSettings(settings);
      if (updatedSettings != null) {
        return Right(updatedSettings);
      }
      return Left(Exception('Failed to update settings'));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
