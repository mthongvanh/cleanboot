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

  /// Sign-out a user
  Future<void> signOut();
}
