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

  /// Update the authenticated user's display/user name
  FutureOr<AuthedUser?> updateUserDisplayName(final String updatedName);

  /// Sign-out of a service
  Future<void> signOut();
}
