import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../cleanboot.dart';

/// {@template GetDisplayNamesUseCase}
/// Gets existing display names from a service
/// {@endtemplate}
class GetDisplayNamesUseCase extends UseCase<List<String>, GetDisplayNamesParams> {
  final AuthRepository _authRepository;

  /// {@macro GetDisplayNamesUseCase}
  GetDisplayNamesUseCase(this._authRepository);

  @override
  Future<({Failure? failure, List<String>? result})> execute(
    final GetDisplayNamesParams params,
  ) async {
    Failure? failure;
    List<String>? result;
    try {
      final response = await _authRepository.getDisplayNames(params);
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
