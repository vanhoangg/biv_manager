import 'package:dartz/dartz.dart';
import '../../entities/settings_entity.dart';
import '../../repositories/settings_repository.dart';

/// Use case for getting application settings
class GetSettingsUseCase {
  final SettingsRepository _repository;

  /// Constructor
  GetSettingsUseCase(this._repository);

  /// Execute the use case
  Future<Either<Exception, SettingsEntity>> call() async {
    try {
      final settings = await _repository.getSettings();
      return Right(settings);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
