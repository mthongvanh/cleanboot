import 'dart:async';

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

  /// Currently authenticated user
  FutureOr<AuthedUser?> currentUser();

  /// Sign-out of a service
  Future<void> signOut();
}
