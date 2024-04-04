import '../../auth.dart';

/// Base class for implementing authentication
abstract class AuthRepository {
  /// Authenticate with a service
  Future<AuthResultModel> authenticate(
    final AuthParams authParameters,
  );

  /// Sign-up with a service
  Future<AuthResultModel> signUp(
    final AuthParams authParameters,
  );
}
