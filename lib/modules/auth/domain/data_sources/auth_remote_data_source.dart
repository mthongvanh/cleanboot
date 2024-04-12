import 'dart:async';

import '../../auth.dart';

/// {@template AuthRemoteDataSource}
/// Authenticates with a remote service
/// {@endtemplate}
abstract class AuthRemoteDataSource {
  /// Perform authentication with a remote service
  Future<AuthResultModel> authenticate(final AuthParams params);

  /// Current authenticated user
  FutureOr<AuthedUserModel?> currentUser();

  /// Sign-up a user
  Future<AuthResultModel> signUp({
    required final String identifier,
    required final String password,
  });

  /// Update the authenticated user's display/user name
  FutureOr<AuthedUserModel?> updateUserDisplayName(final String updatedName);

  /// Sign-out a user
  Future<void> signOut();
}
