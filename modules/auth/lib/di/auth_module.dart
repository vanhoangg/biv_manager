import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/auth/reset_password_usecase.dart';
import '../domain/usecases/auth/sign_in_usecase.dart';
import '../domain/usecases/auth/sign_up_usecase.dart';
import '../presentation/blocs/auth/auth_bloc.dart';

/// Registers auth module dependencies into a shared service locator.
///
/// This is intentionally incremental: the app layer still controls external
/// services (for example `FirebaseAuth`) and calls this module registration.
void registerAuthModule(GetIt sl) {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<FirebaseAuth>()),
  );

  sl.registerLazySingleton(() => SignInUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignUpUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl<AuthRepository>()));

  sl.registerFactory(
    () => AuthBloc(
      signInUseCase: sl<SignInUseCase>(),
      signUpUseCase: sl<SignUpUseCase>(),
      resetPasswordUseCase: sl<ResetPasswordUseCase>(),
    ),
  );
}
