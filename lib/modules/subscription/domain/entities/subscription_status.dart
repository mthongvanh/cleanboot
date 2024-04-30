import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../cleanboot.dart';
import '../../data/models/subscription_status_model.dart';
import 'entitlement.dart';
part 'subscription_status.g.dart';
/// {@template SubscriptionResult}
/// Local representation of a subscription result
/// {@endtemplate}
///
@JsonSerializable(explicitToJson: true)
class SubscriptionStatus extends Equatable {
  /// Indicates whether the subscription is currently active
  final bool isActive;

  /// Details about the user's entitlements under this subscription
  final List<Entitlement>? entitlements;

  /// {@macro SubscriptionResult}
  const SubscriptionStatus({
    required this.isActive,
    this.entitlements,
  });

  factory SubscriptionStatus.fromJson(Map<String, dynamic> json) {
    return _$SubscriptionStatusFromJson(json);
  }

    @override
    Map<String, dynamic> toJson() => _$SubscriptionStatusToJson(this);


    @override
  List<Object?> get props => [
    isActive,
    entitlements,
  ];
}
