import 'dart:async';

import '../../../../cleanboot.dart';
import '../../auth.dart';
import '../../domain/data_sources/auth_remote_data_source.dart';
import '../../domain/params/sign_up_params.dart';
import '../../mappers/mappers.dart';

/// {@template AuthRepositoryImpl}
/// Implements [AuthRepository] base class methods
/// {@endtemplate}
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  /// {@macro AuthRepositoryImpl}
  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<AuthResultModel> authenticate(final AuthParams authParameters) {
    return _remoteDataSource.authenticate(authParameters);
  }

  @override
  Future<AuthResult> signUp(final SignUpParams authParameters) {
    return _remoteDataSource.signUp(
      identifier: authParameters.identifier ?? '',
      password: authParameters.secret ?? '',
      displayName: authParameters.displayName,
    );
  }

  @override
  Future<void> signOut() async {
    await _remoteDataSource.signOut();
  }

  @override
  FutureOr<AuthedUser?> currentUser() async {
    final AuthedUserModel? authed = await _remoteDataSource.currentUser();
    return authed?.toEntity;
  }

  @override
  FutureOr<AuthedUser?> updateUserDisplayName(final String updatedName) async {
    final AuthedUserModel? authedUserModel =
        await _remoteDataSource.updateUserDisplayName(updatedName);
    return authedUserModel?.toEntity;
  }

  @override
  Future<List<String>> getDisplayNames(final GetDisplayNamesParams params) {
    return _remoteDataSource.getDisplayNames(params);
  }

  @override
  Future<bool> displayNameExists(final DisplayNameExistsParams params) {
    return _remoteDataSource.displayNameExists(params);
  }
}
