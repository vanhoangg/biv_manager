import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/settings_dto.dart';

/// Local data source for managing application settings using SharedPreferences
/// Handles CRUD operations for settings persistence
class SettingsLocalDataSource {
  static const String _settingsKey = 'app_settings';
  final SharedPreferences _prefs;

  /// Constructor that requires SharedPreferences instance
  SettingsLocalDataSource(this._prefs);

  /// Save settings to local storage
  /// Returns true if successful, false otherwise
  Future<bool> saveSettings(SettingsDTO settings) async {
    try {
      final jsonString = jsonEncode(settings.toJson());
      return await _prefs.setString(_settingsKey, jsonString);
    } catch (e) {
      return false;
    }
  }

  /// Get settings from local storage
  /// Returns SettingsDTO with default values if no settings are found
  Future<SettingsDTO> getSettings() async {
    try {
      final jsonString = _prefs.getString(_settingsKey);
      if (jsonString == null) {
        return const SettingsDTO();
      }
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return SettingsDTO.fromJson(jsonMap);
    } catch (e) {
      return const SettingsDTO();
    }
  }

  /// Update specific settings fields
  /// Returns updated SettingsDTO if successful, null otherwise
  Future<SettingsDTO?> updateSettings(SettingsDTO newSettings) async {
    try {
      final currentSettings = await getSettings();
      final updatedSettings = currentSettings.copyWith(
        isDarkMode: newSettings.isDarkMode,
        themeColor: newSettings.themeColor,
        languageCode: newSettings.languageCode,
        countryCode: newSettings.countryCode,
        enablePushNotifications: newSettings.enablePushNotifications,
        enableEmailNotifications: newSettings.enableEmailNotifications,
        notificationTypes: newSettings.notificationTypes,
        autoPlayVideos: newSettings.autoPlayVideos,
        enableHapticFeedback: newSettings.enableHapticFeedback,
        enableSoundEffects: newSettings.enableSoundEffects,
        cacheSizeLimit: newSettings.cacheSizeLimit,
        enableAnalytics: newSettings.enableAnalytics,
        enableCrashReporting: newSettings.enableCrashReporting,
        enableLocationServices: newSettings.enableLocationServices,
        fontSize: newSettings.fontSize,
        useSystemFont: newSettings.useSystemFont,
        fontFamily: newSettings.fontFamily,
      );

      final success = await saveSettings(updatedSettings);
      return success ? updatedSettings : null;
    } catch (e) {
      return null;
    }
  }

  /// Delete all settings from local storage
  /// Returns true if successful, false otherwise
  Future<bool> deleteSettings() async {
    try {
      return await _prefs.remove(_settingsKey);
    } catch (e) {
      return false;
    }
  }
}
