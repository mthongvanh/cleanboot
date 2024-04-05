import '../../../../cleanboot.dart';

/// Gets the currently logged-in user
class GetAuthedUserUseCase extends UseCase<AuthedUser, NoParams> {
  /// Provides access to authenticated user
  final AuthRepository _repository;

  /// Gets the currently logged-in user
  GetAuthedUserUseCase(this._repository);

  @override
  Future<({Failure? failure, AuthedUser? result})> execute(
    final NoParams? params,
  ) async {
    AuthFailure? failure;
    AuthedUser? result;
    try {
      result = await _repository.currentUser();
    } catch (e) {
      failure = AuthFailure.invalidCredentials(description: e.toString());
    }
    return (
      failure: failure,
      result: result,
    );
  }
}
