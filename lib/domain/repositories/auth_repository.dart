import 'package:biv_manager/domain/entities/auth_user.dart';

/// Auth repository interface
abstract class AuthRepository {
  /// Sign in with email and password
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Create user with email and password
  Future<AuthUser> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Send password reset email
  Future<void> sendPasswordResetEmail({required String email});

  /// Sign out
  Future<void> signOut();
}
