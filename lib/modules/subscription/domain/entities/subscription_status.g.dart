// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionStatus _$SubscriptionStatusFromJson(Map<String, dynamic> json) =>
    SubscriptionStatus(
      isActive: json['isActive'] as bool,
      entitlements: (json['entitlements'] as List<dynamic>?)
          ?.map((e) => Entitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionStatusToJson(SubscriptionStatus instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'entitlements': instance.entitlements?.map((e) => e.toJson()).toList(),
    };
