import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasources/settings/settings_local_data_source.dart';
import '../data/datasources/settings/settings_remote_data_source.dart';
import '../data/repositories/settings_repository_impl.dart';
import '../domain/repositories/settings_repository.dart';
import '../domain/usecases/settings/get_settings_usecase.dart';
import '../domain/usecases/settings/update_settings_usecase.dart';
import '../presentation/blocs/settings/settings_bloc.dart';

/// Registers settings module dependencies into a shared service locator.
void registerSettingsModule(GetIt sl) {
  sl.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSource(sl<FirebaseRemoteConfig>()),
  );

  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      firestore: sl<FirebaseFirestore>(),
      localDataSource: sl<SettingsLocalDataSource>(),
      remoteDataSource: sl<SettingsRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton(() => GetSettingsUseCase(sl<SettingsRepository>()));
  sl.registerLazySingleton(
    () => UpdateSettingsUseCase(sl<SettingsRepository>()),
  );

  sl.registerFactory(
    () => SettingsBloc(
      getSettingsUseCase: sl<GetSettingsUseCase>(),
      updateSettingsUseCase: sl<UpdateSettingsUseCase>(),
    ),
  );
}
