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

  /// Gets display names
  Future<List<String>> getDisplayNames(final GetDisplayNamesParams params);

  /// Checks whether the display name exists already
  Future<bool> displayNameExists(final DisplayNameExistsParams params);

  /// Update the authenticated user's display/user name
  FutureOr<AuthedUserModel?> updateUserDisplayName(final String updatedName);

  /// Sign-out a user
  Future<void> signOut();

  /// Delete a user
  Future<void> deleteUser();

}
