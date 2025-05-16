import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:biv_manager/presentation/blocs/settings/settings_state.dart';

/// Settings events
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

/// Settings bloc
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  /// Constructor
  SettingsBloc() : super(const SettingsLoading()) {
    on<LoadSettings>(_onLoadSettings);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(const SettingsLoading());
      // TODO: Load settings from storage
      emit(const SettingsLoaded());
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }
}
