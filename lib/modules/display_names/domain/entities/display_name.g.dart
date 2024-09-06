// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisplayName _$DisplayNameFromJson(Map<String, dynamic> json) => DisplayName(
      identifier: json['identifier'] as String,
      createdOn: json['createdOn'] as int,
      displayName: json['displayName'] as String,
      userUid: json['userUid'] as String,
    );

Map<String, dynamic> _$DisplayNameToJson(DisplayName instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'createdOn': instance.createdOn,
      'displayName': instance.displayName,
      'userUid': instance.userUid,
    };
