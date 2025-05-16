import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

/// Utility class for formatting dates and numbers based on locale
class LocaleFormatter {
  /// Format date based on locale
  static String formatDate(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context);
    return DateFormat.yMMMd(locale.languageCode).format(date);
  }

  /// Format time based on locale
  static String formatTime(BuildContext context, DateTime time) {
    final locale = Localizations.localeOf(context);
    return DateFormat.Hm(locale.languageCode).format(time);
  }

  /// Format date and time based on locale
  static String formatDateTime(BuildContext context, DateTime dateTime) {
    final locale = Localizations.localeOf(context);
    return DateFormat.yMMMd(locale.languageCode).add_Hm().format(dateTime);
  }

  /// Format currency based on locale
  static String formatCurrency(BuildContext context, double amount) {
    final locale = Localizations.localeOf(context);
    return NumberFormat.currency(
      locale: locale.languageCode,
      symbol: '₫',
    ).format(amount);
  }

  /// Format number based on locale
  static String formatNumber(BuildContext context, double number) {
    final locale = Localizations.localeOf(context);
    return NumberFormat.decimalPattern(locale.languageCode).format(number);
  }

  /// Format percentage based on locale
  static String formatPercentage(BuildContext context, double percentage) {
    final locale = Localizations.localeOf(context);
    return NumberFormat.percentPattern(locale.languageCode).format(percentage);
  }
}
