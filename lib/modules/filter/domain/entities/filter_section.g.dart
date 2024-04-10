// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterSection _$FilterSectionFromJson(Map<String, dynamic> json) =>
    FilterSection(
      identifier: json['identifier'] as String,
      filterItems: (json['filterItems'] as List<dynamic>)
          .map((e) => FilterItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayText: json['displayText'] as String,
      itemDisplayFormat: json['itemDisplayFormat'] as String,
      multiSelect: json['multiSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$FilterSectionToJson(FilterSection instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'filterItems': instance.filterItems.map((e) => e.toJson()).toList(),
      'displayText': instance.displayText,
      'multiSelect': instance.multiSelect,
      'itemDisplayFormat': instance.itemDisplayFormat,
    };
