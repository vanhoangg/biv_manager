/// Auth module exports
///
/// This file exports all public files from the auth module
/// to enable easy importing from other modules.
library;

// Domain layer
export 'domain/entities/auth_user_entity.dart';
export 'domain/repositories/auth_repository.dart';
export 'domain/usecases/auth/sign_in_usecase.dart';
export 'domain/usecases/auth/sign_up_usecase.dart';
export 'domain/usecases/auth/reset_password_usecase.dart';

// Data layer
export 'data/repositories/auth_repository_impl.dart';
export 'di/auth_module.dart';

// Presentation layer
export 'presentation/blocs/auth/auth_bloc.dart';
export 'presentation/blocs/auth/auth_event.dart';
export 'presentation/blocs/auth/auth_state.dart';
export 'presentation/pages/auth/login_page.dart';
export 'presentation/pages/auth/register_page.dart';
export 'presentation/pages/auth/forgot_password_page.dart';
