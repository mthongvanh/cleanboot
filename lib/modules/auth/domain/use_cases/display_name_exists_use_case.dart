import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../cleanboot.dart';

/// {@template DisplayNameExistsUseCase}
/// Check whether a display name exists
/// {@endtemplate}
class DisplayNameExistsUseCase
    extends UseCase<bool, DisplayNameExistsParams> {
  final GetDisplayNamesUseCase _getDisplayNamesUseCase;

  /// {@macro DisplayNameExistsUseCase}
  DisplayNameExistsUseCase(this._getDisplayNamesUseCase);

  @override
  Future<({Failure? failure, bool? result})> execute(
    final DisplayNameExistsParams params,
  ) async {
    Failure? failure;
    bool? result;
    try {
      final response = await _getDisplayNamesUseCase.execute(
        GetDisplayNamesParams(
          cacheType: params.cacheType,
        ),
      );
      if (response.result != null) {
        result = response.result?.contains(params.displayName);
      } else {
        debugPrint(response.failure?.toString());
        failure = response.failure;
      }
    } catch (e) {
      debugPrint(e.toString());
      failure = Failure(
        description: e.toString(),
      );
    }
    return (failure: failure, result: result);
  }
}
