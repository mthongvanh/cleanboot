import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../cleanboot.dart';

/// {@template GetActiveDisplayNamesUseCase}
/// Gets currently used display names from a service
/// {@endtemplate}
class GetActiveDisplayNamesUseCase
    extends UseCase<Map<String, Map<String, dynamic>>, NoParams> {
  final AuthRepository _authRepository;

  /// {@macro GetActiveDisplayNamesUseCase}
  GetActiveDisplayNamesUseCase(this._authRepository);

  @override
  Future<({Failure? failure, Map<String, Map<String, dynamic>>? result})>
      execute(
    final NoParams params,
  ) async {
    Failure? failure;
    Map<String, Map<String, dynamic>>? result;
    try {
      final response = _authRepository.getActiveDisplayNames();
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
