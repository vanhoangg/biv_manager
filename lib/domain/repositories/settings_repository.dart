import '../entities/settings_entity.dart';

/// Repository interface for managing application settings
/// Defines the contract for settings operations
abstract class SettingsRepository {
  /// Get current settings
  /// Returns the current settings or default settings if none exist
  Future<SettingsEntity> getSettings();

  /// Save settings
  /// Returns true if successful, false otherwise
  Future<bool> saveSettings(SettingsEntity settings);

  /// Update specific settings fields
  /// Returns updated settings if successful, null otherwise
  Future<SettingsEntity?> updateSettings(SettingsEntity settings);

  /// Delete all settings
  /// Returns true if successful, false otherwise
  Future<bool> deleteSettings();

  /// Fetch latest settings from remote source
  /// Returns true if new settings were fetched and activated
  Future<bool> fetchLatestSettings();

  /// Get last fetch timestamp
  DateTime getLastFetchTime();

  /// Get fetch status
  String getFetchStatus();

  /// Get minimum fetch interval
  Duration getMinimumFetchInterval();

  /// Get fetch timeout
  Duration getFetchTimeout();
}
