import 'package:cleanboot/modules/subscription/domain/repositories/subscription_repository.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../data/models/available_subscriptions_model.dart';

import '../../data/models/subscription_result_model.dart';

import '../entities/subscribed_user.dart';
import '../params/purchase_params.dart';

import '../params/subscription_params.dart';

class RevenueCatSubscriptionRepository extends SubscriptionRepository {
  @override
  Future<SubscribedUser> currentUser() async {
    try {
      final userInfo = await Purchases.getCustomerInfo();
      // Assuming you have a method to convert Purchases customer info to your SubscribedUser
      return SubscribedUser.fromRevenueCatUserInfo(userInfo);
    } catch (e) {
      throw Exception("Failed to fetch current user: ${e.toString()}");
    }
  }

  @override
  Future<void> cancelSubscription(SubscriptionParams subscriptionParameters) {
    // TODO: implement cancelSubscription
    throw UnimplementedError();
  }

  @override
  Future<AvailableSubscriptionsModel> fetchAvailableSubscriptions() {
    // TODO: implement fetchAvailableSubscriptions
    throw UnimplementedError();
  }

  @override
  Future<SubscriptionResultModel> fetchSubscriptionStatus(SubscriptionParams subscriptionParameters) {
    // TODO: implement fetchSubscriptionStatus
    throw UnimplementedError();
  }

  @override
  Future<SubscriptionResultModel> purchaseSubscription(PurchaseParams purchaseParameters) {
    // TODO: implement purchaseSubscription
    throw UnimplementedError();
  }

  @override
  Future<void> restorePurchases() {
    // TODO: implement restorePurchases
    throw UnimplementedError();
  }

// Implement other methods as required by the SubscriptionRepository interface
}
