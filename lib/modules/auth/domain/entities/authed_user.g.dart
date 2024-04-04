// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authed_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthedUser _$AuthedUserFromJson(Map<String, dynamic> json) => AuthedUser(
      identifier: json['identifier'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$AuthedUserToJson(AuthedUser instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'email': instance.email,
      'username': instance.username,
    };
