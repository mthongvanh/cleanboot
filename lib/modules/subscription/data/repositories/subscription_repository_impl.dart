import 'dart:async';

import '../../domain/data_sources/subscription_remote_data_source.dart';
import '../../domain/params/subscription_params.dart';
import '../../domain/repositories/subscription_repository.dart';
import '../models/subscription_result_model.dart';


/// {@template SubscriptionRepositoryImpl}
/// Implements [SubscriptionRepository] base class methods
/// {@endtemplate}
class SubscriptionRepositoryImpl extends SubscriptionRepository {
  final SubscriptionsRemoteDataSource _remoteDataSource;

  /// {@macro SubscriptionRepositoryImpl}
  SubscriptionRepositoryImpl(this._remoteDataSource);

  @override
  Future<SubscriptionResultModel> fetchSubscriptionStatus(final SubscriptionParams subscriptionParameters) {
    return _remoteDataSource.fetchSubscriptionStatus(subscriptionParameters);
  }

  @override
  Future<SubscriptionResultModel> purchaseSubscription(final PurchaseParams purchaseParameters) {
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
}
