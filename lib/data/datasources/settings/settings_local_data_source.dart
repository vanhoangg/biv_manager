import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/entities/settings_entity.dart';

abstract class SettingsLocalDataSource {
  Future<void> cacheSettings(SettingsEntity settings);
  Future<SettingsEntity> getCachedSettings();
  Future<void> clearCachedSettings();
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences _sharedPreferences;
  static const String _settingsKey = 'settings';

  SettingsLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<void> cacheSettings(SettingsEntity settings) async {
    await _sharedPreferences.setString(
      _settingsKey,
      jsonEncode(settings.toJson()),
    );
  }

  @override
  Future<SettingsEntity> getCachedSettings() async {
    final jsonString = _sharedPreferences.getString(_settingsKey);
    if (jsonString == null) {
      return const SettingsEntity();
    }
    return SettingsEntity.fromJson(jsonDecode(jsonString));
  }

  @override
  Future<void> clearCachedSettings() async {
    await _sharedPreferences.remove(_settingsKey);
  }
}
