import 'dart:async';

import '../../../../cleanboot.dart';
import '../../auth.dart';
import '../params/sign_up_params.dart';

/// Base class for implementing authentication
abstract class AuthRepository {
  /// Authenticate with a service
  Future<AuthResultModel> authenticate(
    final AuthParams authParameters,
  );

  /// Sign-up with a service
  Future<AuthResult> signUp(
    final SignUpParams authParameters,
  );

  /// Currently authenticated user
  FutureOr<AuthedUser?> currentUser();

  /// Get display names
  Future<List<String>> getDisplayNames(final GetDisplayNamesParams params);

  /// Checks whether the display name exists already
  Future<bool> displayNameExists(final DisplayNameExistsParams params);

  /// Update the authenticated user's display/user name
  FutureOr<AuthedUser?> updateUserDisplayName(final String updatedName);

  /// Sign-out of a service
  Future<void> signOut();
}
