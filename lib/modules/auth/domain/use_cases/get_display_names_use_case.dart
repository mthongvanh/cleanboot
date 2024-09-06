import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../cleanboot.dart';

/// {@template GetDisplayNamesUseCase}
/// Gets existing display names from a service
/// {@endtemplate}
class GetDisplayNamesUseCase extends UseCase<List<DisplayName>, GetDisplayNamesParams> {
  final DisplayNamesRepository _displayNamesRepository;

  /// {@macro GetDisplayNamesUseCase}
  GetDisplayNamesUseCase(this._displayNamesRepository);

  @override
  Future<({Failure? failure, List<DisplayName>? result})> execute(
    final GetDisplayNamesParams params,
  ) async {
    Failure? failure;
    List<DisplayName>? result;
    try {
      final response = await _displayNamesRepository.getDisplayNames(params);
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
