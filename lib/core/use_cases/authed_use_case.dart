import '../../cleanboot.dart';

/// Adds authed user lookup to a class
mixin AuthedUseCase {
  /// Gets the currently signed-in user
  GetAuthedUserUseCase get getAuthedUserUseCase;

  /// Execute the use case
  Future<({Failure? failure, AuthedUser? result})> authedUser() async {
    AuthFailure? failure;
    AuthedUser? result;
    final response = await getAuthedUserUseCase.execute(NoParams());
    if (response.result != null && !response.result!.anonymous) {
      result = response.result;
    } else {
      failure = AuthFailure.invalidCredentials(
        description: response.failure?.description,
      );
    }
    return (failure: failure, result: result);
  }
}
