import 'package:equatable/equatable.dart';

/// {@template PurchaseParams}
/// Provides values used to perform a purchase of a subscription
/// {@endtemplate}
class PurchaseParams extends Equatable {
  /// The identifier of the user making the purchase
  final String userId;

  /// The identifier of the subscription or product being purchased
  final String subscriptionId;

  /// Additional parameters like promo codes might also be included here

  /// {@macro PurchaseParams}
  PurchaseParams({
    required this.userId,
    required this.subscriptionId,
  });

  @override
  List<Object> get props => [userId, subscriptionId];
}
