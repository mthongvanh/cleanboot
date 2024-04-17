import 'dart:async';

import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:flutter/foundation.dart';

import '../../../../cleanboot.dart' as cleanboot;
import '../../domain/data_sources/subscription_remote_data_source.dart';
import '../../mappers/mappers.dart';


/// Manage subscription-related operations with RevenueCat
class RevenueCatRemoteDataSource extends SubscriptionsRemoteDataSource {
  @override
  Future<cleanboot.SubscriptionResultModel> fetchSubscriptionStatus(final cleanboot.SubscriptionParams params) async {
    try {
      final purchaserInfo = await Purchases.getPurchaserInfo();
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
      final purchaserInfo = await Purchases.purchasePackage(params.package);
      final isActive = purchaserInfo.entitlements.all[params.entitlementId]?.isActive ?? false;
      return cleanboot.SubscriptionResultModel(isActive: isActive);
    } on PurchasesException catch (e) {
      throw Exception(_handlePurchaseError(e));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> restorePurchases() async {
    try {
      await Purchases.restoreTransactions();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Handle RevenueCat purchase errors
  String _handlePurchaseError(final PurchasesException e) {
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
  Future<cleanboot.AvailableSubscriptionsModel> fetchAvailableSubscriptions() async {
    try {
      final offerings = await Purchases.getOfferings();
      final packages = offerings.current?.availablePackages ?? [];
      return packages.toModel();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
