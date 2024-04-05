import '../../../../cleanboot.dart';

/// Sign-in a user
class SignInUseCase extends UseCase<AuthResult, AuthParams> {
  /// Provides access to a service for authenticating a user
  final AuthRepository _repository;

  /// Sign-in a user
  SignInUseCase(this._repository);

  @override
  Future<({Failure? failure, AuthResult? result})> execute(
    final AuthParams params,
  ) async {
    AuthFailure? failure;
    AuthResult? result;
    try {
      result = await _repository.authenticate(params);
    } catch (e) {
      failure = AuthFailure.invalidCredentials(description: e.toString());
    }
    return (
      failure: failure,
      result: result,
    );
  }
}
