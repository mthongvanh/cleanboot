import 'package:equatable/equatable.dart';

import '../../../../cleanboot.dart';
import '../../data/models/subscribed_user_model.dart';
import '../../data/models/subscription_result_model.dart';

/// {@template SubscriptionResult}
/// Local representation of a subscription result
/// {@endtemplate}
class SubscriptionResult extends Equatable {
  /// Indicates whether the subscription is currently active
  final bool isActive;

  /// Details about the user's entitlements under this subscription
  final List<EntitlementModel>? entitlements;

  /// User associated to the SubscriptionResult
  final SubscribedUserModel? user;

  /// {@macro SubscriptionResult}
  const SubscriptionResult({
    required this.isActive,
    this.entitlements,
    this.user,
  });

  @override
  List<Object?> get props => [
    isActive,
    entitlements,
    user,
  ];
}
