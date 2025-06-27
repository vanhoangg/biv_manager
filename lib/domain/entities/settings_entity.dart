import 'package:cloud_firestore/cloud_firestore.dart';
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
    this.enableLocationServices = true,
    this.fontSize = 16.0,
    this.useSystemFont = true,
    this.fontFamily = 'Roboto',
  });

  factory SettingsEntity.fromJson(Map<String, dynamic> json) {
    return SettingsEntity(
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      themeColor: json['themeColor'] as String? ?? '#2196F3',
      languageCode: json['languageCode'] as String? ?? 'en',
      countryCode: json['countryCode'] as String? ?? 'US',
      enablePushNotifications: json['enablePushNotifications'] as bool? ?? true,
      enableEmailNotifications:
          json['enableEmailNotifications'] as bool? ?? true,
      notificationTypes:
          (json['notificationTypes'] as List<dynamic>?)?.cast<String>() ??
              ['all'],
      autoPlayVideos: json['autoPlayVideos'] as bool? ?? true,
      enableHapticFeedback: json['enableHapticFeedback'] as bool? ?? true,
      enableSoundEffects: json['enableSoundEffects'] as bool? ?? true,
      cacheSizeLimit: json['cacheSizeLimit'] as int? ?? 100,
      enableAnalytics: json['enableAnalytics'] as bool? ?? true,
      enableCrashReporting: json['enableCrashReporting'] as bool? ?? true,
      enableLocationServices: json['enableLocationServices'] as bool? ?? true,
      fontSize: (json['fontSize'] as num?)?.toDouble() ?? 16.0,
      useSystemFont: json['useSystemFont'] as bool? ?? true,
      fontFamily: json['fontFamily'] as String? ?? 'Roboto',
    );
  }

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
