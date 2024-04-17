import 'dart:async';

import '../../data/models/subscription_result_model.dart';
import '../params/subscription_params.dart';

/// Base class for implementing subscription management
abstract class SubscriptionRepository {
  /// Fetches the current subscription status for a given user
  Future<SubscriptionResultModel> fetchSubscriptionStatus(final SubscriptionParams subscriptionParameters);

  /// Purchases a subscription for a specified product
  Future<SubscriptionResultModel> purchaseSubscription(final PurchaseParams purchaseParameters);

  /// Restores previously made purchases for the current user
  Future<void> restorePurchases();

  /// Fetches all available subscriptions
  Future<AvailableSubscriptionsModel> fetchAvailableSubscriptions();
}
