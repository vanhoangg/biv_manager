import '../../domain/entities/settings_entity.dart';
import '../models/settings_dto.dart';

/// Mapper class for converting between SettingsDTO and SettingsEntity
class SettingsMapper {
  /// Convert SettingsDTO to SettingsEntity
  /// Uses default values from SettingsEntity when DTO values are null
  static SettingsEntity toEntity(SettingsDTO dto) {
    return SettingsEntity(
      isDarkMode: dto.isDarkMode ?? false,
      themeColor: dto.themeColor ?? '#2196F3',
      languageCode: dto.languageCode ?? 'en',
      countryCode: dto.countryCode ?? 'US',
      enablePushNotifications: dto.enablePushNotifications ?? true,
      enableEmailNotifications: dto.enableEmailNotifications ?? true,
      notificationTypes: dto.notificationTypes ?? ['all'],
      autoPlayVideos: dto.autoPlayVideos ?? true,
      enableHapticFeedback: dto.enableHapticFeedback ?? true,
      enableSoundEffects: dto.enableSoundEffects ?? true,
      cacheSizeLimit: dto.cacheSizeLimit ?? 100,
      enableAnalytics: dto.enableAnalytics ?? true,
      enableCrashReporting: dto.enableCrashReporting ?? true,
      enableLocationServices: dto.enableLocationServices ?? false,
      fontSize: dto.fontSize ?? 16.0,
      useSystemFont: dto.useSystemFont ?? true,
      fontFamily: dto.fontFamily ?? 'Roboto',
    );
  }

  /// Convert SettingsEntity to SettingsDTO
  static SettingsDTO toDTO(SettingsEntity entity) {
    return SettingsDTO(
      isDarkMode: entity.isDarkMode,
      themeColor: entity.themeColor,
      languageCode: entity.languageCode,
      countryCode: entity.countryCode,
      enablePushNotifications: entity.enablePushNotifications,
      enableEmailNotifications: entity.enableEmailNotifications,
      notificationTypes: entity.notificationTypes,
      autoPlayVideos: entity.autoPlayVideos,
      enableHapticFeedback: entity.enableHapticFeedback,
      enableSoundEffects: entity.enableSoundEffects,
      cacheSizeLimit: entity.cacheSizeLimit,
      enableAnalytics: entity.enableAnalytics,
      enableCrashReporting: entity.enableCrashReporting,
      enableLocationServices: entity.enableLocationServices,
      fontSize: entity.fontSize,
      useSystemFont: entity.useSystemFont,
      fontFamily: entity.fontFamily,
    );
  }
}
