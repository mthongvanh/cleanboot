// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionStatusModel _$SubscriptionStatusModelFromJson(
        Map<String, dynamic> json) =>
    SubscriptionStatusModel(
      isActive: json['isActive'] as bool,
      entitlements: (json['entitlements'] as List<dynamic>?)
          ?.map((e) => EntitlementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionStatusModelToJson(
        SubscriptionStatusModel instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'entitlements': instance.entitlements?.map((e) => e.toJson()).toList(),
    };
