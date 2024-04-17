import '../../../../cleanboot.dart';
import '../params/subscription_params.dart';
import '../repositories/subscription_repository.dart';
import '../errors/subscription_failures.dart';  // Make sure this path is correct

/// Cancels a user's subscription
class CancelSubscriptionUseCase extends UseCase<void, SubscriptionParams> {
  final SubscriptionRepository _repository;

  CancelSubscriptionUseCase(this._repository);

  @override
  Future<({Failure? failure, void result})> execute(
      final SubscriptionParams params,
      ) async {
    SubscriptionFailure? failure;
    try {
      await _repository.cancelSubscription(params);
    } catch (e) {
      failure = SubscriptionFailure.cancellationFailed(description: e.toString());
    }
    return (
    failure: failure,
    result: null,
    );
  }
}
