import 'package:equatable/equatable.dart';

/// Settings state
abstract class SettingsState extends Equatable {
  /// Constructor
  const SettingsState();

  @override
  List<Object?> get props => [];
}

/// Settings loading state
class SettingsLoading extends SettingsState {
  /// Constructor
  const SettingsLoading();
}

/// Settings error state
class SettingsError extends SettingsState {
  /// Error message
  final String message;

  /// Constructor
  const SettingsError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Settings loaded state
class SettingsLoaded extends SettingsState {
  /// Constructor
  const SettingsLoaded();
}
