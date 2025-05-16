import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Locale events
abstract class LocaleEvent extends Equatable {
  /// Constructor
  const LocaleEvent();

  @override
  List<Object?> get props => [];
}

/// Locale changed event
class LocaleChanged extends LocaleEvent {
  /// New locale
  final Locale locale;

  /// Constructor
  const LocaleChanged(this.locale);

  @override
  List<Object?> get props => [locale];
}
