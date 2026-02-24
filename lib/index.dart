/// Main app exports
///
/// This file exports all files from the main app that are not in packages
/// to enable easy importing from other modules.
library;

// Core
export 'core/config/env_config.dart';

// Data layer
export 'data/datasources/settings/settings_local_data_source.dart';
export 'data/datasources/settings/settings_remote_data_source.dart';
export 'data/datasources/transaction/transaction_local_data_source.dart';
export 'data/models/settings_dto.dart';
export 'data/repositories/settings_repository_impl.dart';
export 'data/mappers/auth_user_mapper.dart';
export 'data/mappers/settings_mapper.dart';

// Domain layer
export 'domain/entities/settings_entity.dart';
export 'domain/repositories/settings_repository.dart';
export 'domain/usecases/settings/get_settings_usecase.dart';
export 'domain/usecases/settings/update_settings_usecase.dart';
export 'domain/usecases/transaction/get_transactions_usecase.dart';

// Presentation layer
export 'presentation/blocs/settings/settings_bloc.dart';
export 'presentation/blocs/settings/settings_event.dart';
export 'presentation/blocs/settings/settings_state.dart';
export 'presentation/pages/about/about_page.dart';
export 'presentation/pages/dashboard/dashboard_page.dart';
export 'presentation/pages/home/home_page.dart';
export 'presentation/pages/home/navigation_type.dart';
export 'presentation/pages/legal/privacy_policy_page.dart';
export 'presentation/pages/legal/terms_page.dart';
export 'presentation/pages/profile/profile_page.dart';
export 'presentation/pages/reports/reports_page.dart';
export 'presentation/pages/settings/settings_page.dart';
export 'presentation/pages/splash/splash_page.dart';
export 'presentation/widgets/custom_app_bar.dart';
export 'presentation/widgets/error_view.dart';
export 'presentation/widgets/loading_indicator.dart';

// Localization
export 'l10n/output/app_localizations.dart';
