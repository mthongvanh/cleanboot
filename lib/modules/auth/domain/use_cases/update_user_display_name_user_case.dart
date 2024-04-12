import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../../cleanboot.dart';


/// {@template UpdateUserDisplayNameUseCase}
/// Updates the user's public-facing display name
/// {@endtemplate}
class UpdateUserDisplayNameUseCase
    extends UseCase<AuthedUser, String> {
  final AuthRepository _authRepository;

  /// {@macro UpdateUserDisplayNameUseCase}
  UpdateUserDisplayNameUseCase(this._authRepository);

  @override
  Future<({Failure? failure, AuthedUser? result})> execute(
      final String params,) async {
    AuthFailure? failure;
    AuthedUser? result;
    try {
      final response = await _authRepository.updateUserDisplayName(params);
      result = response;
    } catch (e) {
      debugPrint(e.toString());
      failure = AuthFailure.invalidCredentials(
        description: e.toString(),
      );
    }
    return (failure: failure, result: result);
  }
}