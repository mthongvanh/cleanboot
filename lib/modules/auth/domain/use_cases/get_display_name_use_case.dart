import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../cleanboot.dart';

/// {@template GetDisplayNameUseCase}
/// Get a display name by the user identifier
/// {@endtemplate}
class GetDisplayNameUseCase extends UseCase<DisplayName?, String> {
  final DisplayNamesRepository _displayNamesRepository;

  /// {@macro GetDisplayNameUseCase}
  GetDisplayNameUseCase(this._displayNamesRepository);

  @override
  Future<({Failure? failure, DisplayName? result})> execute(
    final String params,
  ) async {
    Failure? failure;
    DisplayName? result;
    try {
      final response = await _displayNamesRepository.getDisplayName(params);
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
