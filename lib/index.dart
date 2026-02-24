/// Main app exports
///
/// This file exports all files from the main app that are not in packages
/// to enable easy importing from other modules.
library;

// Data layer
export 'data/mappers/auth_user_mapper.dart';

// Presentation layer
export 'presentation/pages/about/about_page.dart';
export 'presentation/pages/dashboard/dashboard_page.dart';
export 'presentation/pages/home/home_page.dart';
export 'presentation/pages/home/navigation_type.dart';
export 'presentation/pages/legal/privacy_policy_page.dart';
export 'presentation/pages/legal/terms_page.dart';
export 'presentation/pages/profile/profile_page.dart';
export 'presentation/pages/reports/reports_page.dart';
export 'presentation/pages/splash/splash_page.dart';

// Localization
export 'l10n/output/app_localizations.dart';
