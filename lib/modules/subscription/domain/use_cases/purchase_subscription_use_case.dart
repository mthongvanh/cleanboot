import '../../../../cleanboot.dart';
import '../entities/subscription_status.dart';
import '../errors/subscription_failures.dart';
import '../params/purchase_params.dart';
import '../repositories/subscription_repository.dart';

/// Purchase a subscription
class PurchaseSubscriptionUseCase extends UseCase<SubscriptionStatus, PurchaseParams> {
  /// Provides access to a service for purchasing subscriptions
  final SubscriptionRepository _repository;

  /// Purchase a subscription
  PurchaseSubscriptionUseCase(this._repository);

  @override
  Future<({Failure? failure, SubscriptionStatus? result})> execute(
      final PurchaseParams params,
      ) async {
    SubscriptionFailure? failure;
    SubscriptionStatus? result;
    try {
      // result = await _repository.purchaseSubscription(params);
    } catch (e) {
      failure = SubscriptionFailure.cancellationFailed(description: e.toString());
    }
    return (
    failure: failure,
    result: result,
    );
  }
}
