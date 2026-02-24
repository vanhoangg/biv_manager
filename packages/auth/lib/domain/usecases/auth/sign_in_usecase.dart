import '../../entities/auth_user_entity.dart';
import '../../repositories/auth_repository.dart';

/// Sign in use case
class SignInUseCase {
  /// Auth repository
  final AuthRepository _repository;

  /// Constructor
  SignInUseCase(this._repository);

  /// Execute sign in
  Future<AuthUserEntity> execute({
    required String email,
    required String password,
  }) {
    return _repository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
