import '../../repositories/auth_repository.dart';

/// Reset password use case
class ResetPasswordUseCase {
  /// Auth repository
  final AuthRepository _repository;

  /// Constructor
  ResetPasswordUseCase(this._repository);

  /// Execute reset password
  Future<void> execute({required String email}) {
    return _repository.sendPasswordResetEmail(email: email);
  }
}
