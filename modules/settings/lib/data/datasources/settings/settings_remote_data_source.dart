import 'dart:async';
import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../models/settings_dto.dart';

/// Remote data source for managing application settings using Firebase Remote Config
/// Handles fetching and updating settings from remote configuration
class SettingsRemoteDataSource {
  static const String _settingsKey = 'app_settings';
  final FirebaseRemoteConfig _remoteConfig;
  final _configUpdatedController = StreamController<void>.broadcast();

  /// Stream that emits when Remote Config is updated
  Stream<void> get onConfigUpdated => _configUpdatedController.stream;

  /// Constructor that requires FirebaseRemoteConfig instance
  SettingsRemoteDataSource(this._remoteConfig);

  /// Initialize Remote Config with default values
  Future<void> initialize() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));

      await _remoteConfig.setDefaults({
        _settingsKey: jsonEncode(const SettingsDTO().toJson()),
      });

      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      // Handle initialization error
      rethrow;
    }
  }

  /// Get settings from Remote Config
  /// Returns SettingsDTO with default values if no settings are found
  Future<SettingsDTO> getSettings() async {
    try {
      // Check if Remote Config needs to be fetched
      final lastFetchTime = _remoteConfig.lastFetchTime;
      final minimumFetchInterval = _remoteConfig.settings.minimumFetchInterval;

      if (DateTime.now().difference(lastFetchTime) > minimumFetchInterval) {
        // Fetch and activate new config
        final activated = await _remoteConfig.fetchAndActivate();
        if (activated) {
          _configUpdatedController.add(null);
        }
      }

      final jsonString = _remoteConfig.getString(_settingsKey);
      if (jsonString.isEmpty) {
        return const SettingsDTO();
      }
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return SettingsDTO.fromJson(jsonMap);
    } catch (e) {
      return const SettingsDTO();
    }
  }

  /// Fetch latest settings from Remote Config
  /// Returns true if new settings were fetched and activated
  Future<bool> fetchLatestSettings() async {
    try {
      return await _remoteConfig.fetchAndActivate();
    } catch (e) {
      return false;
    }
  }

  /// Get last fetch timestamp
  DateTime getLastFetchTime() {
    return _remoteConfig.lastFetchTime;
  }

  /// Get fetch status
  String getFetchStatus() {
    return _remoteConfig.lastFetchStatus.toString();
  }

  /// Get minimum fetch interval
  Duration getMinimumFetchInterval() {
    return _remoteConfig.settings.minimumFetchInterval;
  }

  /// Get fetch timeout
  Duration getFetchTimeout() {
    return _remoteConfig.settings.fetchTimeout;
  }

  /// Dispose the Remote Config listener
  void dispose() {
    _configUpdatedController.close();
  }
}
