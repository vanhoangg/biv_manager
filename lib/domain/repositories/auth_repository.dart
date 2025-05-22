import '../entities/auth_user_entity.dart';

/// Auth repository interface
abstract class AuthRepository {
  /// Sign in with email and password
  Future<AuthUserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Create user with email and password
  Future<AuthUserEntity> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Send password reset email
  Future<void> sendPasswordResetEmail({required String email});

  /// Sign out
  Future<void> signOut();
}
