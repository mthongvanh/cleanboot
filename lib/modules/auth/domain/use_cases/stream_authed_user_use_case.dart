import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../cleanboot.dart';

/// {@template StreamAuthedUserUseCase}
/// Get the authed user and listen for user changes such as sign-in and sign-out
/// {@endtemplate}
class StreamAuthedUserUseCase
    extends UseCase<Stream<AuthedUser?>, NoParams> {
  final AuthRepository _authRepository;

  /// {@macro StreamAuthedUserUseCase}
  StreamAuthedUserUseCase(this._authRepository);

  @override
  Future<({Failure? failure, Stream<AuthedUser?>? result})> execute(
      final NoParams params,) async {
    Failure? failure;
    Stream<AuthedUser?>? result;
    try {
      final response = _authRepository.streamCurrentUser();
      result = response;
    } catch (e) {
      debugPrint(e.toString());
      failure = Failure(
        description: e.toString(),
      );
    }
    return (failure: failure, result: result);
  }
}