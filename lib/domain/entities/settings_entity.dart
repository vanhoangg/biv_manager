import 'package:equatable/equatable.dart';

/// Entity class representing application settings
/// This is the core business object used throughout the application
class SettingsEntity extends Equatable {
  /// Theme settings
  final bool isDarkMode;
  final String themeColor;

  /// Language settings
  final String languageCode;
  final String countryCode;

  /// Notification settings
  final bool enablePushNotifications;
  final bool enableEmailNotifications;
  final List<String> notificationTypes;

  /// App behavior settings
  final bool autoPlayVideos;
  final bool enableHapticFeedback;
  final bool enableSoundEffects;
  final int cacheSizeLimit;

  /// Privacy settings
  final bool enableAnalytics;
  final bool enableCrashReporting;
  final bool enableLocationServices;

  /// Display settings
  final double fontSize;
  final bool useSystemFont;
  final String fontFamily;

  /// Default constructor
  const SettingsEntity({
    this.isDarkMode = false,
    this.themeColor = '#2196F3',
    this.languageCode = 'en',
    this.countryCode = 'US',
    this.enablePushNotifications = true,
    this.enableEmailNotifications = true,
    this.notificationTypes = const ['all'],
    this.autoPlayVideos = true,
    this.enableHapticFeedback = true,
    this.enableSoundEffects = true,
    this.cacheSizeLimit = 100,
    this.enableAnalytics = true,
    this.enableCrashReporting = true,
    this.enableLocationServices = false,
    this.fontSize = 16.0,
    this.useSystemFont = true,
    this.fontFamily = 'Roboto',
  });

  @override
  List<Object?> get props => [
        isDarkMode,
        themeColor,
        languageCode,
        countryCode,
        enablePushNotifications,
        enableEmailNotifications,
        notificationTypes,
        autoPlayVideos,
        enableHapticFeedback,
        enableSoundEffects,
        cacheSizeLimit,
        enableAnalytics,
        enableCrashReporting,
        enableLocationServices,
        fontSize,
        useSystemFont,
        fontFamily,
      ];

  /// Create a copy of this SettingsEntity with the given fields replaced with the new values
  SettingsEntity copyWith({
    bool? isDarkMode,
    String? themeColor,
    String? languageCode,
    String? countryCode,
    bool? enablePushNotifications,
    bool? enableEmailNotifications,
    List<String>? notificationTypes,
    bool? autoPlayVideos,
    bool? enableHapticFeedback,
    bool? enableSoundEffects,
    int? cacheSizeLimit,
    bool? enableAnalytics,
    bool? enableCrashReporting,
    bool? enableLocationServices,
    double? fontSize,
    bool? useSystemFont,
    String? fontFamily,
  }) {
    return SettingsEntity(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      themeColor: themeColor ?? this.themeColor,
      languageCode: languageCode ?? this.languageCode,
      countryCode: countryCode ?? this.countryCode,
      enablePushNotifications:
          enablePushNotifications ?? this.enablePushNotifications,
      enableEmailNotifications:
          enableEmailNotifications ?? this.enableEmailNotifications,
      notificationTypes: notificationTypes ?? this.notificationTypes,
      autoPlayVideos: autoPlayVideos ?? this.autoPlayVideos,
      enableHapticFeedback: enableHapticFeedback ?? this.enableHapticFeedback,
      enableSoundEffects: enableSoundEffects ?? this.enableSoundEffects,
      cacheSizeLimit: cacheSizeLimit ?? this.cacheSizeLimit,
      enableAnalytics: enableAnalytics ?? this.enableAnalytics,
      enableCrashReporting: enableCrashReporting ?? this.enableCrashReporting,
      enableLocationServices:
          enableLocationServices ?? this.enableLocationServices,
      fontSize: fontSize ?? this.fontSize,
      useSystemFont: useSystemFont ?? this.useSystemFont,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsEntity &&
          runtimeType == other.runtimeType &&
          isDarkMode == other.isDarkMode &&
          themeColor == other.themeColor &&
          languageCode == other.languageCode &&
          countryCode == other.countryCode &&
          enablePushNotifications == other.enablePushNotifications &&
          enableEmailNotifications == other.enableEmailNotifications &&
          notificationTypes == other.notificationTypes &&
          autoPlayVideos == other.autoPlayVideos &&
          enableHapticFeedback == other.enableHapticFeedback &&
          enableSoundEffects == other.enableSoundEffects &&
          cacheSizeLimit == other.cacheSizeLimit &&
          enableAnalytics == other.enableAnalytics &&
          enableCrashReporting == other.enableCrashReporting &&
          enableLocationServices == other.enableLocationServices &&
          fontSize == other.fontSize &&
          useSystemFont == other.useSystemFont &&
          fontFamily == other.fontFamily;

  @override
  int get hashCode =>
      isDarkMode.hashCode ^
      themeColor.hashCode ^
      languageCode.hashCode ^
      countryCode.hashCode ^
      enablePushNotifications.hashCode ^
      enableEmailNotifications.hashCode ^
      notificationTypes.hashCode ^
      autoPlayVideos.hashCode ^
      enableHapticFeedback.hashCode ^
      enableSoundEffects.hashCode ^
      cacheSizeLimit.hashCode ^
      enableAnalytics.hashCode ^
      enableCrashReporting.hashCode ^
      enableLocationServices.hashCode ^
      fontSize.hashCode ^
      useSystemFont.hashCode ^
      fontFamily.hashCode;
}
