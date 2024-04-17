import 'package:equatable/equatable.dart';

/// {@template SubscriptionParams}
/// Provides values used to perform various subscription-related actions
/// {@endtemplate}
class SubscriptionParams with EquatableMixin {
  /// User or account identifier, typically used to link the subscription to a specific user
  final String userId;

  /// Subscription or product identifier for purchasing or querying subscriptions
  final String? subscriptionId;


  final String entitlementId;

  /// {@macro SubscriptionParams}
  SubscriptionParams({
    required this.userId,
    this.subscriptionId,
    required this.entitlementId,
  });

  /// Creates parameters for a user-specific subscription query
  factory SubscriptionParams.userSpecific({required String userId, required String entitlementId}) => SubscriptionParams(
    userId: userId, entitlementId: entitlementId,
  );

  @override
  List<Object?> get props => [
    userId,
    subscriptionId,
    entitlementId
  ];
}
