import 'dart:async';

import '../../../../cleanboot.dart';
import '../../data/models/available_subscriptions_model.dart';
import '../../data/models/subscription_status_model.dart';
import '../params/purchase_params.dart';
import '../params/subscription_params.dart';

/// {@template SubscriptionsRemoteDataSource}
/// Manages subscriptions with a remote service
/// {@endtemplate}
abstract class SubscriptionsRemoteDataSource {
  /// Fetches the current subscription status for a given user
  Future<SubscriptionStatusModel> getSubscriptionStatus(final SubscriptionParams params);

  /// Purchases a subscription for the current user
  Future<SubscriptionStatusModel> purchaseSubscription(final PurchaseParams params);

  /// Restores the purchases for the current user
  Future<void> restorePurchases();

  /// Fetches available subscriptions from the remote service
  Future<AvailableSubscriptionsModel> fetchAvailableSubscriptions();
}
