import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../../cleanboot.dart';

/// {@template AssignRandomDisplayNameUseCase}
/// Assigns a random username by attaching a random number to a base string
///
/// Providing `painter` as the base string returns `painter98736`
/// {@endtemplate}
class AssignRandomDisplayNameUseCase
    extends UseCase<AuthedUser, (String baseString, bool retry)> {
  final AuthRepository _authRepository;

  /// {@macro AssignRandomDisplayNameUseCase}
  AssignRandomDisplayNameUseCase(this._authRepository);

  @override
  Future<({Failure? failure, AuthedUser? result})> execute(
    final (String baseString, bool retry) params,
  ) async {
    AuthFailure? failure;
    AuthedUser? result;
    try {
      String username = '${DateTime.now().millisecondsSinceEpoch}';
      username = '${params.$1}${username.substring(username.length - 5)}';

      final response = await _authRepository.updateUserDisplayName(username);
      if (response != null) {
        result = response;
      } else {
        if (params.$2) {
          debugPrint('failed to assign username on retry');
          failure = AuthFailure.invalidCredentials(
            description: 'failed to assign username on retry',
          );
        } else {
          debugPrint('failed to assign the username');
          final retryResponse = await execute(params);
          if (retryResponse.result != null) {
            result = retryResponse.result;
          } else {
            failure = AuthFailure.invalidCredentials(
              description: retryResponse.failure?.description,
            );
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      failure = AuthFailure.invalidCredentials(
        description: e.toString(),
      );
    }
    return (failure: failure, result: result);
  }
}
