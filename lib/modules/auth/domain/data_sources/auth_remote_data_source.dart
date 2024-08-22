import 'dart:async';

import '../../../../cleanboot.dart';
import '../../auth.dart';

/// {@template AuthRemoteDataSource}
/// Authenticates with a remote service
/// {@endtemplate}
abstract class AuthRemoteDataSource {
  /// Perform authentication with a remote service
  Future<AuthResultModel> authenticate(final AuthParams params);

  /// Current authenticated user
  FutureOr<AuthedUserModel?> currentUser();

  /// Stream the current user and listen for user changes (e.g. sign in as different user)
  Stream<AuthedUserModel?> streamCurrentUser();

  /// Sign-up a user
  Future<AuthResultModel> signUp({
    required final String identifier,
    required final String password,
    final String? displayName,
  });

  /// Gets all display names created including inactive usernames
  Future<List<String>> getDisplayNames(final GetDisplayNamesParams params);

  /// Get only currently used display names
  Map<String, Map<String, dynamic>> getActiveDisplayNames();

  /// Checks whether the display name exists already
  Future<bool> displayNameExists(final DisplayNameExistsParams params);

  /// Update the authenticated user's display/user name
  FutureOr<AuthedUserModel?> updateUserDisplayName(final String updatedName);

  /// Get display name data by the user identifier
  Map<String, dynamic>? getDisplayName(final String userIdentifier);

  /// Listen for display/username changes
  void subscribeDisplayNames();

  /// Sign-out a user
  Future<void> signOut();

  /// Delete a user
  Future<void> deleteUser();

}
