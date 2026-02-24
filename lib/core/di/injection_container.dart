import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import from packages
import 'package:core/index.dart' as core;
import 'package:shared/index.dart';
import 'package:auth/index.dart';
import 'package:customer/index.dart';
import 'package:settings/index.dart';
import 'package:transaction/index.dart';

/// Service locator instance
final GetIt sl = GetIt.instance;

/// Initialize dependency injection container
/// Manually registers all dependencies without code generation
Future<void> init() async {
  // Initialize core module
  await core.init();

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  final remoteConfig = FirebaseRemoteConfig.instance;
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => remoteConfig);

  // App constants
  sl.registerLazySingleton(() => AppConstants());

  // Firebase services
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Theme
  sl.registerLazySingleton(() => ThemeManager(sl()));

  // Localization
  sl.registerLazySingleton(() => LocalizationService());

  // RTL
  sl.registerLazySingleton(() => RTLService(sl()));

  // Repositories
  registerAuthModule(sl);
  registerSettingsModule(sl);
  registerCustomerModule(sl);
  registerTransactionModule(sl);

  // Use cases
}
