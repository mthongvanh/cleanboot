import 'dart:async';

import '../../auth.dart';
import '../../domain/data_sources/auth_remote_data_source.dart';
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
  Future<AuthResultModel> signUp(final AuthParams authParameters) {
    return _remoteDataSource.signUp(
      identifier: authParameters.identifier ?? '',
      password: authParameters.secret ?? '',
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
}
