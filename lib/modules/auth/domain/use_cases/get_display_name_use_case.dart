import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../cleanboot.dart';

/// {@template GetDisplayNameUseCase}
/// Get a display name by the user identifier
/// {@endtemplate}
class GetDisplayNameUseCase extends UseCase<Map<String, dynamic>?, String> {
  final AuthRepository _authRepository;

  /// {@macro GetDisplayNameUseCase}
  GetDisplayNameUseCase(this._authRepository);

  @override
  Future<({Failure? failure, Map<String, dynamic>? result})> execute(
    final String params,
  ) async {
    Failure? failure;
    Map<String, dynamic>? result;
    try {
      final response = _authRepository.getDisplayName(params);
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
