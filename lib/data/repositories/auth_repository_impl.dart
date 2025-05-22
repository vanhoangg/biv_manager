import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/di/injection_container.dart';
import '../../domain/entities/auth_user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../shared/index.dart';
import '../mappers/auth_user_mapper.dart';

/// Auth repository implementation
class AuthRepositoryImpl implements AuthRepository {
  /// Firebase Auth instance
  final FirebaseAuth _auth;

  /// Constructor
  AuthRepositoryImpl(this._auth);

  void _validateUserCredential(UserCredential userCredential) async {
    if (userCredential.user == null) {
      throw Exception('User is null after sign in');
    }
    if (userCredential.user?.uid == null) {
      throw Exception('User ID is null after sign in');
    }
    // Save token in shared preferences
    sl<SharedPreferences>()
        .setString(AppConstants.storageToken, userCredential.user?.uid ?? '');
  }

  @override
  Future<AuthUserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // MARK: Backdoor for testing
      if (email == '1' && password == '1') {
        final mockUser = AuthUserEntity(
          id: Random().nextInt(1000000).toString(),
          email: email,
          displayName: 'Test User',
          photoUrl: null,
          accessToken: 'test-access-token',
        );
        sl<SharedPreferences>()
            .setString(AppConstants.storageToken, mockUser.accessToken ?? '');
        return mockUser;
      }

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential);
      _validateUserCredential(userCredential);

      return AuthUserMapper.fromUserCredential(userCredential);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AuthUserEntity> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _validateUserCredential(userCredential);

      return AuthUserMapper.fromUserCredential(userCredential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'User creation failed');
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Password reset failed');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Sign out failed');
    }
  }
}
