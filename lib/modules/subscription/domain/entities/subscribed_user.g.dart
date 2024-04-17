// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribed_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribedUser _$SubscribedUserFromJson(Map<String, dynamic> json) =>
    SubscribedUser(
      identifier: json['identifier'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      anonymous: json['anonymous'] as bool,
      isActiveSubscriber: json['isActiveSubscriber'] as bool,
      entitlements: (json['entitlements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SubscribedUserToJson(SubscribedUser instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'email': instance.email,
      'username': instance.username,
      'anonymous': instance.anonymous,
      'isActiveSubscriber': instance.isActiveSubscriber,
      'entitlements': instance.entitlements,
    };
