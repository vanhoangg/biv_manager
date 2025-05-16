import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

/// Events for locale management
abstract class LocaleEvent extends Equatable {
  /// Constructor
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

/// Event to change locale
class LocaleChanged extends LocaleEvent {
  /// New locale
  final Locale locale;

  /// Constructor
  const LocaleChanged(this.locale);

  @override
  List<Object> get props => [locale];
}

/// State for locale management
class LocaleState extends Equatable {
  /// Current locale
  final Locale locale;

  /// Constructor
  const LocaleState(this.locale);

  /// Default state
  factory LocaleState.defaultState() => const LocaleState(Locale('en'));

  @override
  List<Object> get props => [locale];
}

/// Bloc for locale management
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  /// Constructor
  LocaleBloc() : super(LocaleState.defaultState()) {
    on<LocaleChanged>(_onLocaleChanged);
  }

  void _onLocaleChanged(
    LocaleChanged event,
    Emitter<LocaleState> emit,
  ) {
    emit(LocaleState(event.locale));
  }
}
