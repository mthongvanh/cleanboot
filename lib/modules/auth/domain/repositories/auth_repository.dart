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

  /// Listen for changes on the authed user
  Stream<AuthedUser?> streamCurrentUser();

  /// Get display names
  Future<List<String>> getDisplayNames(final GetDisplayNamesParams params);

  /// Get active display names
  Map<String, Map<String, dynamic>> getActiveDisplayNames();

  /// Checks whether the display name exists already
  Future<bool> displayNameExists(final DisplayNameExistsParams params);

  /// Update the authenticated user's display/user name
  FutureOr<AuthedUser?> updateUserDisplayName(final String updatedName);

  /// Listen for display/user name changes
  void subscribeDisplayNames();

  /// Get a display name by the user identifier
  Map<String, dynamic>? getDisplayName(final String userIdentifier);

  /// Sign-out of a service
  Future<void> signOut();

  /// Delete a user
  Future<void> deleteUser();
}
