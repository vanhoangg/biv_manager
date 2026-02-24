import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

typedef AppLocalizationLookup = Object? Function(BuildContext context);

/// Localization service that handles app translations
class LocalizationService extends ChangeNotifier {
  static AppLocalizationLookup? _appLocalizationLookup;
  Locale _locale = const Locale('en');

  /// Get supported locales
  static List<Locale> get supportedLocales => const [
        Locale('en'),
        Locale('vi'),
      ];

  /// Get localization delegates
  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  /// Get current locale
  Locale get locale => _locale;

  /// Register app-specific localization lookup from the app layer.
  static void registerAppLocalizationLookup(AppLocalizationLookup lookup) {
    _appLocalizationLookup = lookup;
  }

  /// Resolve app-specific localizations without coupling shared to generated code.
  static dynamic appL10nOf(BuildContext context) {
    final localizations = _appLocalizationLookup?.call(context);
    if (localizations == null) {
      throw FlutterError(
        'App localization lookup is not registered or returned null. '
        'Register it from the app layer and include the app localization delegate.',
      );
    }
    return localizations;
  }

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
