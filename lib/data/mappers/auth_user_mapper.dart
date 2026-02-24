import 'package:firebase_auth/firebase_auth.dart';

import 'package:auth/domain/entities/auth_user_entity.dart';

/// Mapper for converting UserCredential to AuthUser
class AuthUserMapper {
  /// Convert UserCredential to AuthUser
  static AuthUserEntity fromUserCredential(UserCredential credential) {
    final user = credential.user;
    if (user == null) {
      throw Exception('User is null in UserCredential');
    }

    final result = AuthUserEntity(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL,
      accessToken: credential.credential?.accessToken,
    );

    return result;
  }
}
