import 'package:equatable/equatable.dart';
import '../../../domain/entities/settings_entity.dart';

/// Base class for settings events
abstract class SettingsEvent extends Equatable {
  /// Constructor
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

/// Load settings event
class LoadSettings extends SettingsEvent {
  /// Constructor
  const LoadSettings();
}

/// Update settings event
class UpdateSettings extends SettingsEvent {
  /// New settings
  final SettingsEntity settings;

  /// Constructor
  const UpdateSettings(this.settings);

  @override
  List<Object?> get props => [settings];
}

/// Toggle dark mode event
class ToggleDarkMode extends SettingsEvent {
  /// Constructor
  const ToggleDarkMode();
}

/// Update language event
class UpdateLanguage extends SettingsEvent {
  /// Language code
  final String languageCode;

  /// Country code
  final String countryCode;

  /// Constructor
  const UpdateLanguage({
    required this.languageCode,
    required this.countryCode,
  });

  @override
  List<Object?> get props => [languageCode, countryCode];
}
