import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../cleanboot.dart';
import '../../domain/entities/entitlement.dart';
import 'entitlement_model.dart';
part 'subscription_status_model.g.dart';
/// {@template SubscriptionResultModel}
/// External representation of a subscription result
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class SubscriptionStatusModel extends Equatable {
  /// {@macro SubscriptionResultModel}

  /// Indicates whether the subscription is currently active
  final bool isActive;

  /// Details about the user's entitlements under this subscription
  final List<EntitlementModel>? entitlements;

  /// {@macro SubscriptionResult}
  const SubscriptionStatusModel({
    required this.isActive,
    this.entitlements,
  });

  factory SubscriptionStatusModel.fromJson(Map<String, dynamic> json) {
    return _$SubscriptionStatusModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$SubscriptionStatusModelToJson(this);



  @override
  List<Object?> get props => [
    isActive,
    entitlements,
  ];
}
