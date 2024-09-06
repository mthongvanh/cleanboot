import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../cleanboot.dart';

/// {@template GetActiveDisplayNamesUseCase}
/// Gets currently used display names from a service
/// {@endtemplate}
class GetActiveDisplayNamesUseCase
    extends UseCase<Map<String, DisplayName>, NoParams> {
  final DisplayNamesRepository _displayNamesRepository;

  /// {@macro GetActiveDisplayNamesUseCase}
  GetActiveDisplayNamesUseCase(this._displayNamesRepository);

  @override
  Future<({Failure? failure, Map<String, DisplayName>? result})>
      execute(
    final NoParams params,
  ) async {
    Failure? failure;
    Map<String, DisplayName>? result;
    try {
      final response = await _displayNamesRepository.getActiveDisplayNames();
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
