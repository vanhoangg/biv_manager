import 'package:equatable/equatable.dart';
import '../../../domain/entities/settings_entity.dart';

/// Base class for settings states
abstract class SettingsState extends Equatable {
  /// Constructor
  const SettingsState();

  @override
  List<Object?> get props => [];
}

/// Initial settings state
class SettingsInitial extends SettingsState {
  /// Constructor
  const SettingsInitial();
}

/// Loading settings state
class SettingsLoading extends SettingsState {
  /// Constructor
  const SettingsLoading();
}

/// Loaded settings state
class SettingsLoaded extends SettingsState {
  /// Settings data
  final SettingsEntity settings;

  /// Constructor
  const SettingsLoaded(this.settings);

  @override
  List<Object?> get props => [settings];
}

/// Error settings state
class SettingsError extends SettingsState {
  /// Error message
  final String message;

  /// Constructor
  const SettingsError(this.message);

  @override
  List<Object?> get props => [message];
}
