// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authed_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthedUserModel _$AuthedUserModelFromJson(Map<String, dynamic> json) =>
    AuthedUserModel(
      identifier: json['identifier'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$AuthedUserModelToJson(AuthedUserModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'email': instance.email,
      'username': instance.username,
    };
