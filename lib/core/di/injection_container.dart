import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../theme/theme_manager.dart';
import '../services/localization_service.dart';
import '../services/rtl_service.dart';
import 'package:biv_manager/presentation/blocs/theme/theme_bloc.dart';
import 'package:biv_manager/presentation/blocs/auth/auth_bloc.dart';
import 'package:biv_manager/domain/repositories/auth_repository.dart';
import 'package:biv_manager/data/repositories/auth_repository_impl.dart';
import 'package:biv_manager/domain/usecases/auth/sign_in_usecase.dart';
import 'package:biv_manager/domain/usecases/auth/sign_up_usecase.dart';
import 'package:biv_manager/domain/usecases/auth/reset_password_usecase.dart';

/// Service locator instance
final GetIt sl = GetIt.instance;

/// Initialize all dependencies
Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

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
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));

  // Blocs
  sl.registerFactory(() => ThemeBloc(sl()));
  sl.registerFactory(
    () => AuthBloc(
      signInUseCase: sl(),
      signUpUseCase: sl(),
      resetPasswordUseCase: sl(),
    ),
  );
}
