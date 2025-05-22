// import 'package:flutter/foundation.dart';

import '../../shared/index.dart';

/// Environment configuration for the app
class EnvConfig {
  /// Base URL for API calls
  final String baseUrl;

  /// API key for external services
  final String apiKey;

  /// Backdoor test account credentials
  final BackdoorAccount backdoorAccount;

  /// Environment name (dev, staging, prod)
  final String environment;

  /// Whether this is a production build
  final bool isProduction;

  /// Firebase configuration
  final FirebaseConfig firebaseConfig;

  const EnvConfig({
    required this.baseUrl,
    required this.apiKey,
    required this.backdoorAccount,
    required this.environment,
    required this.firebaseConfig,
    this.isProduction = false,
  });

  /// Development environment configuration
  static EnvConfig get dev => EnvConfig(
        baseUrl: EnvVariables.currentBaseUrl,
        apiKey: EnvVariables.currentApiKey,
        backdoorAccount: const BackdoorAccount(
          email: 'test@biv.com',
          password: 'test123',
        ),
        environment: 'dev',
        firebaseConfig: EnvVariables.currentFirebaseConfig,
      );

  /// Staging environment configuration
  static EnvConfig get staging => EnvConfig(
        baseUrl: EnvVariables.currentBaseUrl,
        apiKey: EnvVariables.currentApiKey,
        backdoorAccount: const BackdoorAccount(
          email: 'test@biv.com',
          password: 'test123',
        ),
        environment: 'staging',
        firebaseConfig: EnvVariables.currentFirebaseConfig,
      );

  /// Production environment configuration
  static EnvConfig get prod => EnvConfig(
        baseUrl: EnvVariables.currentBaseUrl,
        apiKey: EnvVariables.currentApiKey,
        backdoorAccount: const BackdoorAccount(
          email: 'test@biv.com',
          password: 'test123',
        ),
        environment: 'prod',
        firebaseConfig: EnvVariables.currentFirebaseConfig,
        isProduction: true,
      );

  /// Get current environment based on flavor
  static EnvConfig get current {
    const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
    switch (flavor) {
      case 'prod':
        return prod;
      case 'staging':
        return staging;
      case 'dev':
      default:
        return dev;
    }
  }
}

/// Backdoor test account configuration
class BackdoorAccount {
  /// Test account email
  final String email;

  /// Test account password
  final String password;

  const BackdoorAccount({
    required this.email,
    required this.password,
  });
}
