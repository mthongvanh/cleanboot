import '../../../../cleanboot.dart';
import '../entities/subscribed_user.dart';
import '../errors/subscription_failures.dart';
import '../repositories/subscription_repository.dart';

/// Gets the currently subscribed user along with their subscription details
class GetSubscribedUserUseCase extends UseCase<SubscribedUser, NoParams> {
  /// Provides access to subscribed user details
  final SubscriptionRepository _repository;

  /// Gets the currently subscribed user
  GetSubscribedUserUseCase(this._repository);

  @override
  Future<({Failure? failure, SubscribedUser? result})> execute(
      final NoParams? params,
      ) async {
    SubscriptionFailure? failure;
    SubscribedUser? result;
    try {
      result = await _repository.currentUser();
    } catch (e) {
      failure = SubscriptionFailure.issueWithSubscription(description: e.toString());
    }
    return (
    failure: failure,
    result: result,
    );
  }
}
