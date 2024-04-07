import 'dart:async';

import 'package:cleanboot/cleanboot.dart';
import 'package:flutter/material.dart';

import '../domain/repositories/{{repoName.snakeCase()}}_repository.dart';

/// {@template {{identifier.pascalCase()}}UseCase}
/// {@endtemplate}
class {{identifier.pascalCase()}}UseCase
    extends UseCase<List<String>, NoParams> {
  final {{repoName.pascalCase()}}Repository _{{repoName.camelCase()}}Repository;

  /// {@macro {{identifier.pascalCase()}}UseCase}
  {{identifier.pascalCase()}}UseCase(this._{{repoName.camelCase()}}Repository);

  @override
  Future<({Failure? failure, List<String>? result})> execute(
      final NoParams params,) async {
    Failure? failure;
    List<String>? result;
    try {
      final response = await _{{repoName.camelCase()}}Repository.{{identifier.camelCase()}}();
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