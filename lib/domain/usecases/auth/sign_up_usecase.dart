import '../../entities/auth_user_entity.dart';
import '../../repositories/auth_repository.dart';

/// Sign up use case
class SignUpUseCase {
  /// Auth repository
  final AuthRepository _repository;

  /// Constructor
  SignUpUseCase(this._repository);

  /// Execute sign up
  Future<AuthUserEntity> execute({
    required String email,
    required String password,
  }) {
    return _repository.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
