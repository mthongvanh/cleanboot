// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribed_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribedUserModel _$SubscribedUserModelFromJson(Map<String, dynamic> json) =>
    SubscribedUserModel(
      identifier: json['identifier'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      anonymous: json['anonymous'] as bool,
      isActiveSubscriber: json['isActiveSubscriber'] as bool?,
      entitlements: (json['entitlements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SubscribedUserModelToJson(
        SubscribedUserModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'email': instance.email,
      'username': instance.username,
      'anonymous': instance.anonymous,
      'isActiveSubscriber': instance.isActiveSubscriber,
      'entitlements': instance.entitlements,
    };
