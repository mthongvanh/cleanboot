// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      identifier: json['identifier'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      anonymous: json['anonymous'] as bool,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'email': instance.email,
      'username': instance.username,
      'anonymous': instance.anonymous,
    };
