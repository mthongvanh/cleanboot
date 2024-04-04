// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      identifier: json['identifier'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'email': instance.email,
      'username': instance.username,
    };
