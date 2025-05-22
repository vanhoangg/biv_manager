/// Mock JSON example for SettingsDTO
/// ```json
/// {
///   "isDarkMode": false,
///   "themeColor": "#2196F3",
///   "languageCode": "en",
///   "countryCode": "US",
///   "enablePushNotifications": true,
///   "enableEmailNotifications": true,
///   "notificationTypes": ["all", "updates", "promotions"],
///   "autoPlayVideos": true,
///   "enableHapticFeedback": true,
///   "enableSoundEffects": true,
///   "cacheSizeLimit": 100,
///   "enableAnalytics": true,
///   "enableCrashReporting": true,
///   "enableLocationServices": false,
///   "fontSize": 16.0,
///   "useSystemFont": true,
///   "fontFamily": "Roboto"
/// }
/// ```

/// Settings data transfer objects for the application
/// This library contains DTOs related to application settings and configuration
library;

/// Data Transfer Object for application settings
/// Contains all configurable settings used throughout the app
class SettingsDTO {
  /// Theme settings
  final bool? isDarkMode;
  final String? themeColor;

  /// Language settings
  final String? languageCode;
  final String? countryCode;

  /// Notification settings
  final bool? enablePushNotifications;
  final bool? enableEmailNotifications;
  final List<String>? notificationTypes;

  /// App behavior settings
  final bool? autoPlayVideos;
  final bool? enableHapticFeedback;
  final bool? enableSoundEffects;
  final int? cacheSizeLimit;

  /// Privacy settings
  final bool? enableAnalytics;
  final bool? enableCrashReporting;
  final bool? enableLocationServices;

  /// Display settings
  final double? fontSize;
  final bool? useSystemFont;
  final String? fontFamily;

  /// Default constructor
  const SettingsDTO({
    this.isDarkMode,
    this.themeColor,
    this.languageCode,
    this.countryCode,
    this.enablePushNotifications,
    this.enableEmailNotifications,
    this.notificationTypes,
    this.autoPlayVideos,
    this.enableHapticFeedback,
    this.enableSoundEffects,
    this.cacheSizeLimit,
    this.enableAnalytics,
    this.enableCrashReporting,
    this.enableLocationServices,
    this.fontSize,
    this.useSystemFont,
    this.fontFamily,
  });

  /// Create a copy of this SettingsDTO with the given fields replaced with the new values
  SettingsDTO copyWith({
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
    return SettingsDTO(
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

  /// Convert SettingsDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'isDarkMode': isDarkMode,
      'themeColor': themeColor,
      'languageCode': languageCode,
      'countryCode': countryCode,
      'enablePushNotifications': enablePushNotifications,
      'enableEmailNotifications': enableEmailNotifications,
      'notificationTypes': notificationTypes,
      'autoPlayVideos': autoPlayVideos,
      'enableHapticFeedback': enableHapticFeedback,
      'enableSoundEffects': enableSoundEffects,
      'cacheSizeLimit': cacheSizeLimit,
      'enableAnalytics': enableAnalytics,
      'enableCrashReporting': enableCrashReporting,
      'enableLocationServices': enableLocationServices,
      'fontSize': fontSize,
      'useSystemFont': useSystemFont,
      'fontFamily': fontFamily,
    };
  }

  /// Create SettingsDTO from JSON
  factory SettingsDTO.fromJson(Map<String, dynamic> json) {
    return SettingsDTO(
      isDarkMode: json['isDarkMode'] as bool?,
      themeColor: json['themeColor'] as String?,
      languageCode: json['languageCode'] as String?,
      countryCode: json['countryCode'] as String?,
      enablePushNotifications: json['enablePushNotifications'] as bool?,
      enableEmailNotifications: json['enableEmailNotifications'] as bool?,
      notificationTypes: (json['notificationTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      autoPlayVideos: json['autoPlayVideos'] as bool?,
      enableHapticFeedback: json['enableHapticFeedback'] as bool?,
      enableSoundEffects: json['enableSoundEffects'] as bool?,
      cacheSizeLimit: json['cacheSizeLimit'] as int?,
      enableAnalytics: json['enableAnalytics'] as bool?,
      enableCrashReporting: json['enableCrashReporting'] as bool?,
      enableLocationServices: json['enableLocationServices'] as bool?,
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      useSystemFont: json['useSystemFont'] as bool?,
      fontFamily: json['fontFamily'] as String?,
    );
  }

  /// Get default values for all settings
  static SettingsDTO get defaults => const SettingsDTO(
        isDarkMode: false,
        themeColor: '#2196F3',
        languageCode: 'en',
        countryCode: 'US',
        enablePushNotifications: true,
        enableEmailNotifications: true,
        notificationTypes: ['all'],
        autoPlayVideos: true,
        enableHapticFeedback: true,
        enableSoundEffects: true,
        cacheSizeLimit: 100,
        enableAnalytics: true,
        enableCrashReporting: true,
        enableLocationServices: false,
        fontSize: 16.0,
        useSystemFont: true,
        fontFamily: 'Roboto',
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsDTO &&
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
