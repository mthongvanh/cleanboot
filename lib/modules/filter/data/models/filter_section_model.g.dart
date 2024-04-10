// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterSectionModel _$FilterSectionModelFromJson(Map<String, dynamic> json) =>
    FilterSectionModel(
      identifier: json['identifier'] as String,
      filterItems: (json['filterItems'] as List<dynamic>)
          .map((e) => FilterItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayText: json['displayText'] as String,
      itemDisplayFormat: json['itemDisplayFormat'] as String,
      multiSelect: json['multiSelect'] as bool? ?? false,
    );

Map<String, dynamic> _$FilterSectionModelToJson(FilterSectionModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'filterItems': instance.filterItems.map((e) => e.toJson()).toList(),
      'displayText': instance.displayText,
      'multiSelect': instance.multiSelect,
      'itemDisplayFormat': instance.itemDisplayFormat,
    };
