import 'package:biv_manager/domain/entities/auth_user.dart';
import 'package:biv_manager/domain/repositories/auth_repository.dart';

/// Sign in use case
class SignInUseCase {
  /// Auth repository
  final AuthRepository _repository;

  /// Constructor
  SignInUseCase(this._repository);

  /// Execute sign in
  Future<AuthUser> execute({
    required String email,
    required String password,
  }) {
    return _repository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
