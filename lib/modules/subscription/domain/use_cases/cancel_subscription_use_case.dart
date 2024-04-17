import '../../../../cleanboot.dart';
import '../params/subscription_params.dart';
import '../repositories/subscription_repository.dart';

/// Cancels a user's subscription
class CancelSubscriptionUseCase extends UseCase<void, SubscriptionParams> {
  /// Provides access to a service for managing subscriptions
  final SubscriptionRepository _repository;

  /// Cancels a user's subscription
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
