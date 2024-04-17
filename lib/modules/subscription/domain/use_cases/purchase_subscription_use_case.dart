import '../../../../cleanboot.dart';
import '../entities/subscription_result.dart';
import '../repositories/subscription_repository.dart';

/// Purchase a subscription
class PurchaseSubscriptionUseCase extends UseCase<SubscriptionResult, PurchaseParams> {
  /// Provides access to a service for purchasing subscriptions
  final SubscriptionRepository _repository;

  /// Purchase a subscription
  PurchaseSubscriptionUseCase(this._repository);

  @override
  Future<({Failure? failure, SubscriptionResult? result})> execute(
      final PurchaseParams params,
      ) async {
    SubscriptionFailure? failure;
    SubscriptionResult? result;
    try {
      result = await _repository.purchaseSubscription(params);
    } catch (e) {
      failure = SubscriptionFailure.purchaseFailed(description: e.toString());
    }
    return (
    failure: failure,
    result: result,
    );
  }
}
