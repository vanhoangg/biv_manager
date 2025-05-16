import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Locale state
class LocaleState extends Equatable {
  /// Current locale
  final Locale locale;

  /// Constructor
  const LocaleState({
    this.locale = const Locale('en'),
  });

  /// Create a copy of this state with the given fields replaced with the new values
  LocaleState copyWith({
    Locale? locale,
  }) {
    return LocaleState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [locale];
}
