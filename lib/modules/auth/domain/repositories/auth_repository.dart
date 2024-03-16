import '../params/auth_params.dart';

/// Base class for implementing authentication
abstract class AuthRepository {
  /// Authenticate with a service
  Future<(Exception, bool)> authenticate(
    final AuthParams authParameters,
  );
}
