import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Network info interface
abstract class NetworkInfo {
  /// Check if device is connected to internet
  Future<bool> get isConnected;
}

/// Network info implementation
class NetworkInfoImpl implements NetworkInfo {
  /// Internet connection checker
  final InternetConnectionChecker connectionChecker;

  /// Constructor
  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
