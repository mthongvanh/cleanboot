import 'dart:async';

import '../../../../cleanboot.dart';
import '../../domain/data_sources/subscription_remote_data_source.dart';
import '../../domain/params/purchase_params.dart';
import '../../mappers/mappers.dart';
import '../../mappers/subscription_result/subscription_status_mapper.dart';
import '../models/available_subscriptions_model.dart';

/// {@template SubscriptionRepositoryImpl}
/// Implements [SubscriptionRepository] base class methods
/// {@endtemplate}
class SubscriptionRepositoryImpl extends SubscriptionRepository {
  final SubscriptionsRemoteDataSource _remoteDataSource;

  /// {@macro SubscriptionRepositoryImpl}
  SubscriptionRepositoryImpl(this._remoteDataSource);

  @override
  Future<SubscriptionStatus> getSubscriptionStatus(final SubscriptionParams subscriptionParameters) async {
    final subscriptionStatus =  await _remoteDataSource.getSubscriptionStatus(subscriptionParameters);
    return subscriptionStatus.toEntity;
  }

  @override
  Future<SubscriptionStatusModel> purchaseSubscription(final PurchaseParams purchaseParameters) {
    return _remoteDataSource.purchaseSubscription(purchaseParameters);
  }

  @override
  Future<void> restorePurchases() async {
    await _remoteDataSource.restorePurchases();
  }

  @override
  Future<AvailableSubscriptionsModel> fetchAvailableSubscriptions() async {
    return _remoteDataSource.fetchAvailableSubscriptions();
  }

  @override
  Future<void> cancelSubscription(SubscriptionParams subscriptionParameters) {
    // TODO: implement cancelSubscription
    throw UnimplementedError();
  }

}
