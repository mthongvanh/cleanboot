import '../../../../cleanboot.dart';

/// Sign-out a user
class SignOutUseCase extends UseCase<void, NoParams> {
  /// Provides access to a service for authenticating a user
  final AuthRepository _repository;

  /// Sign-out a user
  SignOutUseCase(this._repository);

  @override
  Future<({Failure? failure, void result})> execute(
    final NoParams params,
  ) async {
    AuthFailure? failure;
    try {
      await _repository.signOut();
    } catch (e) {
      failure = AuthFailure.invalidCredentials(description: e.toString());
    }
    return (
      failure: failure,
      result: null,
    );
  }
}
