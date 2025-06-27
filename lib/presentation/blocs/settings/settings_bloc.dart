import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/usecases/settings/get_settings_usecase.dart';
import '../../../domain/usecases/settings/update_settings_usecase.dart';
import 'settings_event.dart';
import 'settings_state.dart';

/// Settings bloc
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSettingsUseCase _getSettingsUseCase;
  final UpdateSettingsUseCase _updateSettingsUseCase;

  /// Constructor
  SettingsBloc({
    required GetSettingsUseCase getSettingsUseCase,
    required UpdateSettingsUseCase updateSettingsUseCase,
  })  : _getSettingsUseCase = getSettingsUseCase,
        _updateSettingsUseCase = updateSettingsUseCase,
        super(const SettingsInitial()) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateSettings>(_onUpdateSettings);
    on<ToggleDarkMode>(_onToggleDarkMode);
    on<UpdateLanguage>(_onUpdateLanguage);
    on<UpdateFontFamily>(_onUpdateFontFamily);
    on<UpdateFontSize>(_onUpdateFontSize);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(const SettingsLoading());
      final result = await _getSettingsUseCase(const NoParams());
      result.fold(
        onSuccess: (settings) => emit(SettingsLoaded(settings)),
        onFailure: (failure) => emit(SettingsError(failure.message)),
      );
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  Future<void> _onUpdateSettings(
    UpdateSettings event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(const SettingsLoading());
      final result = await _updateSettingsUseCase(event.settings);
      result.fold(
        onSuccess: (_) => emit(SettingsLoaded(event.settings)),
        onFailure: (failure) => emit(SettingsError(failure.message)),
      );
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  Future<void> _onToggleDarkMode(
    ToggleDarkMode event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is SettingsLoaded) {
        final updatedSettings = currentState.settings.copyWith(
          isDarkMode: !currentState.settings.isDarkMode,
        );
        add(UpdateSettings(updatedSettings));
      }
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  Future<void> _onUpdateLanguage(
    UpdateLanguage event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is SettingsLoaded) {
        final updatedSettings = currentState.settings.copyWith(
          languageCode: event.languageCode,
          countryCode: event.countryCode,
        );
        add(UpdateSettings(updatedSettings));
      }
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  Future<void> _onUpdateFontFamily(
    UpdateFontFamily event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is SettingsLoaded) {
        final updatedSettings = currentState.settings.copyWith(
          fontFamily: event.fontFamily,
        );
        add(UpdateSettings(updatedSettings));
      }
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  Future<void> _onUpdateFontSize(
    UpdateFontSize event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      final currentState = state;
      if (currentState is SettingsLoaded) {
        final updatedSettings = currentState.settings.copyWith(
          fontSize: event.fontSize,
        );
        add(UpdateSettings(updatedSettings));
      }
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }
}
