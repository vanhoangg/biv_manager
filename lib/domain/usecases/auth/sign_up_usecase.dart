import 'package:biv_manager/domain/entities/auth_user.dart';
import 'package:biv_manager/domain/repositories/auth_repository.dart';

/// Sign up use case
class SignUpUseCase {
  /// Auth repository
  final AuthRepository _repository;

  /// Constructor
  SignUpUseCase(this._repository);

  /// Execute sign up
  Future<AuthUser> execute({
    required String email,
    required String password,
  }) {
    return _repository.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
