import 'dart:async';

import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:flutter/foundation.dart';

import '../../../../cleanboot.dart' as cleanboot;
import '../../domain/data_sources/subscription_remote_data_source.dart';
import '../../domain/params/purchase_params.dart' as cleanboot;
import '../../mappers/mappers.dart';
import '../models/available_subscriptions_model.dart';


/// Manage subscription-related operations with RevenueCat
class RevenueCatRemoteDataSource extends SubscriptionsRemoteDataSource {
  @override
  Future<cleanboot.SubscriptionResultModel> fetchSubscriptionStatus(final cleanboot.SubscriptionParams params) async {
    try {
      final purchaserInfo = await Purchases.getCustomerInfo();
      final isActive = purchaserInfo.entitlements.all[params.entitlementId]?.isActive ?? false;
      return cleanboot.SubscriptionResultModel(isActive: isActive);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<cleanboot.SubscriptionResultModel> purchaseSubscription(final cleanboot.PurchaseParams params) async {
    try {
      final purchaserInfo = await Purchases.purchasePackage(params.props);
      final isActive = purchaserInfo.entitlements.all[params.entitlementId]?.isActive ?? false;
      return cleanboot.SubscriptionResultModel(isActive: isActive);
    } on PurchasesError catch (e) {
      throw Exception(_handlePurchaseError(e));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> restorePurchases() async {
    try {
      await Purchases.restorePurchases();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Handle RevenueCat purchase errors
  String _handlePurchaseError(final PurchasesError e) {
    String errorMessage;
    switch (e.code) {
      case PurchasesErrorCode.purchaseCancelledError:
        errorMessage = 'Purchase was cancelled.';
        break;
      case PurchasesErrorCode.purchaseNotAllowedError:
        errorMessage = 'Purchase not allowed.';
        break;
      case PurchasesErrorCode.purchaseInvalidError:
        errorMessage = 'Purchase is invalid.';
        break;
      default:
        errorMessage = 'An unexpected error occurred.';
        break;
    }
    return errorMessage;
  }

  @override
  Future<AvailableSubscriptionsModel> fetchAvailableSubscriptions() async {
    try {
      final offerings = await Purchases.getOfferings();
      return AvailableSubscriptionsModel.fromOfferings(offerings);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
