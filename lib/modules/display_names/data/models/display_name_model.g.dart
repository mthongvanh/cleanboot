// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_name_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisplayNameModel _$DisplayNameModelFromJson(Map<String, dynamic> json) =>
    DisplayNameModel(
      identifier: json['identifier'] as String,
      createdOn: json['createdOn'] as int,
      displayName: json['displayName'] as String,
      userUid: json['userUid'] as String,
    );

Map<String, dynamic> _$DisplayNameModelToJson(DisplayNameModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'createdOn': instance.createdOn,
      'displayName': instance.displayName,
      'userUid': instance.userUid,
    };
