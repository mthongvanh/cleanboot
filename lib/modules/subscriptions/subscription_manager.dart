import 'package:purchases_flutter/purchases_flutter.dart';

class SubscriptionManager {
  static const String monthlyProductId = 'monthly_subscription';
  static const String annualProductId = 'annual_subscription';

  // Initializes RevenueCat with API keys
  Future<void> initialize() async {
    try {
      await Purchases.configure(PurchasesConfiguration('your_revenuecat_api_key'));
    } catch (e) {
      // _handleError(e);
    }
  }

  // Fetch available subscriptions
  Future<Map<String, Package>> fetchAvailableSubscriptions() async {
    try {
      final offerings = await Purchases.getOfferings();
      if (offerings.current != null) {
        return {for (var pkg in offerings.current!.availablePackages) pkg.storeProduct.identifier: pkg};
      }
      return {};
    } catch (e) {
      // _handleError(e);
      return {};
    }
  }

  // Subscribe to a product
  Future<bool> subscribe(String productId) async {
    try {
      final package = await _getPackageForProduct(productId);
      final purchaserInfo = await Purchases.purchasePackage(package);
      return purchaserInfo.entitlements.active.values.any((entitlement) => entitlement.isActive);
    } catch (e) {
      // _handleError(e);
      return false;
    }
  }

  // Helper method to retrieve the correct package for a product
  Future<Package> _getPackageForProduct(String productId) async {
    final offerings = await Purchases.getOfferings();
    return offerings.all.values
        .map((offering) => offering.availablePackages)
        .expand((packages) => packages)
        .firstWhere((package) => package.storeProduct.identifier == productId);
  }

  // Check the current subscription status
  Future<bool> checkSubscriptionStatus() async {
    try {
      final purchaserInfo = await Purchases.getCustomerInfo();
      return purchaserInfo.entitlements.active.values.any((entitlement) => entitlement.isActive);
    } catch (e) {
      // _handleError(e);
      return false;
    }
  }

  // Private method to handle errors
  // void _handleError(Exception e) {
  //   print('Error in Subscription Management: $e');
  // }
}

// Usage Example:
void main() async {
  SubscriptionManager manager = SubscriptionManager();
  await manager.initialize();

  // Fetch and display available subscriptions
  final availableSubscriptions = await manager.fetchAvailableSubscriptions();
  for (var pkg in availableSubscriptions.values) {
    print('Available Subscription: ${pkg.storeProduct.identifier}, Price: ${pkg.storeProduct.priceString}');
  }

  // Subscribe to a product
  bool isSubscribed = await manager.subscribe(SubscriptionManager.monthlyProductId);  // For monthly subscription
  print('Subscription successful: $isSubscribed');

  // Check subscription status
  bool status = await manager.checkSubscriptionStatus();
  print('Is Subscribed: $status');
}
