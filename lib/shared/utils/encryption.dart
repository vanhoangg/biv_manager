import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

/// Utility class for encryption and decryption
class Encryption {
  /// Encryption key (should be stored securely)
  static const String _key = String.fromEnvironment('ENCRYPTION_KEY',
      defaultValue: 'your-32-char-encryption-key-here');

  /// Encryption IV (should be stored securely)
  static const String _iv = String.fromEnvironment('ENCRYPTION_IV',
      defaultValue: 'your-16-char-iv-here');

  /// Encrypt a string value
  static String encryptValue(String value) {
    try {
      final key = encrypt.Key.fromUtf8(_key);
      final iv = encrypt.IV.fromUtf8(_iv);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final encrypted = encrypter.encrypt(value, iv: iv);
      return encrypted.base64;
    } catch (e) {
      throw Exception('Encryption failed: $e');
    }
  }

  /// Decrypt a string value
  static String decryptValue(String encryptedValue) {
    try {
      final key = encrypt.Key.fromUtf8(_key);
      final iv = encrypt.IV.fromUtf8(_iv);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final decrypted = encrypter.decrypt64(encryptedValue, iv: iv);
      return decrypted;
    } catch (e) {
      throw Exception('Decryption failed: $e');
    }
  }

  /// Hash a string value (one-way encryption)
  static String hashValue(String value) {
    final bytes = utf8.encode(value);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  /// Verify a hashed value
  static bool verifyHash(String value, String hashedValue) {
    return hashValue(value) == hashedValue;
  }
}
