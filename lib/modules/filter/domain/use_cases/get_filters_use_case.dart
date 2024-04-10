import 'dart:async';

import '../../../../cleanboot.dart';
import 'package:flutter/material.dart';

/// {@template GetFiltersUseCase}
/// {@endtemplate}
class GetFiltersUseCase extends UseCase<List<FilterSection>, NoParams> {
  final FilterRepository _filterRepository;

  /// {@macro GetFiltersUseCase}
  GetFiltersUseCase(this._filterRepository);

  @override
  Future<({Failure? failure, List<FilterSection>? result})> execute(
    final NoParams params,
  ) async {
    FilterFailure? failure;
    List<FilterSection>? result;
    try {
      final response = await _filterRepository.filters();
      result = response;
    } catch (e) {
      debugPrint(e.toString());
      failure = FilterFailure(
        description: e.toString(),
      );
    }
    return (failure: failure, result: result);
  }
}
