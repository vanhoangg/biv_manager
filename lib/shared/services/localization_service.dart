import 'package:biv_manager/l10n/output/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

/// Localization service that handles app translations
class LocalizationService extends ChangeNotifier {
  Locale _locale = const Locale('en');

  /// Get supported locales
  static List<Locale> get supportedLocales => const [
        Locale('en'),
        Locale('vi'),
      ];

  /// Get localization delegates
  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  /// Get current locale
  Locale get locale => _locale;

  /// Get current locale
  Future<Locale> getCurrentLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode =
        prefs.getString(AppConstants.storageKeys.language) ?? 'en';
    _locale = Locale(languageCode);
    notifyListeners();
    return _locale;
  }

  /// Set current locale
  Future<void> setCurrentLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.storageKeys.language, languageCode);
    _locale = Locale(languageCode);
    notifyListeners();
  }
}
