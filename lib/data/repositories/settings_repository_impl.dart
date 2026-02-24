import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/result.dart';
import 'package:core/error/failures.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings/settings_local_data_source.dart';
import '../datasources/settings/settings_remote_data_source.dart';
import '../models/settings_dto.dart';
import '../mappers/settings_mapper.dart';

/// Implementation of SettingsRepository
/// Combines local and remote data sources to provide a unified settings interface
class SettingsRepositoryImpl implements SettingsRepository {
  final FirebaseFirestore _firestore;
  final SettingsLocalDataSource _localDataSource;
  final SettingsRemoteDataSource _remoteDataSource;
  SettingsDTO? _lastRemoteSettings;

  /// Constructor that requires both local and remote data sources
  SettingsRepositoryImpl({
    required FirebaseFirestore firestore,
    required SettingsLocalDataSource localDataSource,
    required SettingsRemoteDataSource remoteDataSource,
  })  : _firestore = firestore,
        _localDataSource = localDataSource,
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
        await _localDataSource
            .cacheSettings(SettingsMapper.toEntity(remoteSettings));
      }
    });
  }

  @override
  Future<Result<SettingsEntity>> getSettings() async {
    try {
      final settings = await _remoteDataSource.getSettings();
      await _localDataSource.cacheSettings(SettingsMapper.toEntity(settings));
      return Result.success(SettingsMapper.toEntity(settings));
    } on ServerFailure catch (e) {
      try {
        final cachedSettings = await _localDataSource.getCachedSettings();
        return Result.success(cachedSettings);
      } catch (e) {
        return Result.failure(UnknownFailure());
      }
    } catch (e) {
      return Result.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateSettings(SettingsEntity settings) async {
    try {
      await _localDataSource.cacheSettings(settings);
      return Result.success(null);
    } catch (e) {
      return Result.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<bool> saveSettings(SettingsEntity settings) async {
    try {
      await _localDataSource.cacheSettings(settings);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteSettings() async {
    try {
      await _localDataSource.clearCachedSettings();
      return true;
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
        await _localDataSource
            .cacheSettings(SettingsMapper.toEntity(remoteSettings));
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
