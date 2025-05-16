import 'package:firebase_auth/firebase_auth.dart';
import 'package:biv_manager/domain/entities/auth_user.dart';
import 'package:biv_manager/domain/repositories/auth_repository.dart';

/// Auth repository implementation
class AuthRepositoryImpl implements AuthRepository {
  /// Firebase Auth instance
  final FirebaseAuth _auth;

  /// Constructor
  AuthRepositoryImpl(this._auth);

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // MARK: Backdoor for testing
      if (email == 'test@biv.com' && password == 'test123') {
        return AuthUser(
          id: 'test-user-id',
          email: email,
          displayName: 'Test User',
          photoUrl: null,
        );
      }

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw Exception('User is null after sign in');
      }

      return AuthUser(
        id: user.uid,
        email: user.email!,
        displayName: user.displayName,
        photoUrl: user.photoURL,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Authentication failed');
    }
  }

  @override
  Future<AuthUser> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw Exception('User is null after creation');
      }

      return AuthUser(
        id: user.uid,
        email: user.email!,
        displayName: user.displayName,
        photoUrl: user.photoURL,
      );
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
