// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteParams _$RouteParamsFromJson(Map<String, dynamic> json) => RouteParams(
      entityIdentifiers: (json['entityIdentifiers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      customMap: (json['customMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
    );

Map<String, dynamic> _$RouteParamsToJson(RouteParams instance) =>
    <String, dynamic>{
      'entityIdentifiers': instance.entityIdentifiers,
      'customMap': instance.customMap,
    };
