import 'package:equatable/equatable.dart';

class PurchaseParams extends Equatable {
  final String userId;
  final String subscriptionId;
  final String entitlementId; // Add this if needed

  PurchaseParams({
    required this.userId,
    required this.subscriptionId,
    required this.entitlementId, // Make optional if not always required
  });

  @override
  List<Object?> get props => [userId, subscriptionId, entitlementId];
}
