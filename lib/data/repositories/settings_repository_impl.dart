import '../../domain/entities/settings_entity.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings/settings_local_data_source.dart';
import '../datasources/settings/settings_remote_data_source.dart';
import '../models/settings_dto.dart';
import '../mappers/settings_mapper.dart';

/// Implementation of SettingsRepository
/// Combines local and remote data sources to provide a unified settings interface
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource _localDataSource;
  final SettingsRemoteDataSource _remoteDataSource;
  SettingsDTO? _lastRemoteSettings;

  /// Constructor that requires both local and remote data sources
  SettingsRepositoryImpl({
    required SettingsLocalDataSource localDataSource,
    required SettingsRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource {
    // Initialize Remote Config listener
    _initializeRemoteConfigListener();
  }

  /// Initialize Remote Config listener to detect changes
  void _initializeRemoteConfigListener() {
    _remoteDataSource.onConfigUpdated.listen((_) async {
      final remoteSettings = await _remoteDataSource.getSettings();
      if (_lastRemoteSettings != remoteSettings) {
        _lastRemoteSettings = remoteSettings;
        await _localDataSource.saveSettings(remoteSettings);
      }
    });
  }

  @override
  Future<SettingsEntity> getSettings() async {
    try {
      // Get settings from Remote Config
      final remoteSettings = await _remoteDataSource.getSettings();

      // If Remote Config has settings, save them locally and return
      if (remoteSettings != const SettingsDTO()) {
        _lastRemoteSettings = remoteSettings;
        await _localDataSource.saveSettings(remoteSettings);
        return SettingsMapper.toEntity(remoteSettings);
      }

      // If no Remote Config settings, try to get from local storage
      final localSettings = await _localDataSource.getSettings();

      // If local settings exist, return them
      if (localSettings != const SettingsDTO()) {
        return SettingsMapper.toEntity(localSettings);
      }

      // If neither exists, return default settings
      return const SettingsEntity();
    } catch (e) {
      // If any error occurs, return default settings
      return const SettingsEntity();
    }
  }

  @override
  Future<bool> saveSettings(SettingsEntity settings) async {
    try {
      final dto = SettingsMapper.toDTO(settings);
      final localSuccess = await _localDataSource.saveSettings(dto);
      return localSuccess;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<SettingsEntity?> updateSettings(SettingsEntity settings) async {
    try {
      final dto = SettingsMapper.toDTO(settings);
      final updatedDTO = await _localDataSource.updateSettings(dto);
      if (updatedDTO != null) {
        return SettingsMapper.toEntity(updatedDTO);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> deleteSettings() async {
    try {
      return await _localDataSource.deleteSettings();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> fetchLatestSettings() async {
    try {
      final success = await _remoteDataSource.fetchLatestSettings();
      if (success) {
        final remoteSettings = await _remoteDataSource.getSettings();
        await _localDataSource.saveSettings(remoteSettings);
      }
      return success;
    } catch (e) {
      return false;
    }
  }

  @override
  DateTime getLastFetchTime() {
    return _remoteDataSource.getLastFetchTime();
  }

  @override
  String getFetchStatus() {
    return _remoteDataSource.getFetchStatus();
  }

  @override
  Duration getMinimumFetchInterval() {
    return _remoteDataSource.getMinimumFetchInterval();
  }

  @override
  Duration getFetchTimeout() {
    return _remoteDataSource.getFetchTimeout();
  }
}
