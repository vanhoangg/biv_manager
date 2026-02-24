import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared/index.dart';
import '../../domain/entities/auth_user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

/// Auth repository implementation
class AuthRepositoryImpl implements AuthRepository {
  /// Firebase Auth instance
  final FirebaseAuth _firebaseAuth;

  /// Constructor
  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<AuthUserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user data locally
      await prefs.setString(
          AppConstants.storageKeys.token, credential.user?.uid ?? '');
      await prefs.setString(AppConstants.storageKeys.user, email);

      return AuthUserEntity(
        id: credential.user?.uid ?? '',
        email: credential.user?.email ?? '',
        displayName: credential.user?.displayName,
        photoUrl: credential.user?.photoURL,
        accessToken: credential.credential?.accessToken,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<AuthUserEntity> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user data locally
      await prefs.setString(
          AppConstants.storageKeys.token, credential.user?.uid ?? '');
      await prefs.setString(AppConstants.storageKeys.user, email);

      return AuthUserEntity(
        id: credential.user?.uid ?? '',
        email: credential.user?.email ?? '',
        displayName: credential.user?.displayName,
        photoUrl: credential.user?.photoURL,
        accessToken: credential.credential?.accessToken,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await _firebaseAuth.signOut();

      // Clear local storage
      await prefs.remove(AppConstants.storageKeys.token);
      await prefs.remove(AppConstants.storageKeys.user);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}
