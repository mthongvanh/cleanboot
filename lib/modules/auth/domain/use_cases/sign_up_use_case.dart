import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../cleanboot.dart';
import '../params/sign_up_params.dart';

/// {@template SignUpUseCase}
/// Sign up a user with a service
/// {@endtemplate}
class SignUpUseCase extends UseCase<AuthResult, SignUpParams> {
  final AuthRepository _authRepository;

  /// {@macro SignUpUseCase}
  SignUpUseCase(this._authRepository);

  @override
  Future<({Failure? failure, AuthResult? result})> execute(
    final SignUpParams params,
  ) async {
    AuthFailure? failure;
    AuthResult? result;
    try {
      final response = await _authRepository.signUp(params);
      result = response;
    } catch (e) {
      debugPrint(e.toString());
      failure = AuthFailure.signUp(
        description: e.toString(),
      );
    }
    return (failure: failure, result: result);
  }
}
