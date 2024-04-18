import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../cleanboot.dart';

/// {@template DeleteUserUseCase}
/// Deletes a user from the remote service
/// {@endtemplate}
class DeleteUserUseCase extends UseCase<Object?, NoParams> {
  final AuthRepository _authRepository;

  /// {@macro DeleteUserUseCase}
  DeleteUserUseCase(this._authRepository);

  @override
  Future<({Failure? failure, Object? result})> execute(
    final NoParams params,
  ) async {
    Failure? failure;
    Object? result;
    try {
      final _ = await _authRepository.deleteUser();
      result = null;
    } catch (e) {
      debugPrint(e.toString());
      failure = Failure(
        description: e.toString(),
      );
    }
    return (failure: failure, result: result);
  }
}
