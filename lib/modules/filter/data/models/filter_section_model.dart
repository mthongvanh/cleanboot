import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'filter_item_model.dart';

part 'filter_section_model.g.dart';

/// {@macro FilterSection}
@JsonSerializable(explicitToJson: true)
class FilterSectionModel extends Equatable {
  /// Object property identifier, e.g. userID or messageID
  final String identifier;

  /// Value used when filtering, as opposed to [displayText] value
  final List<FilterItemModel> filterItems;

  /// User-facing text to describe the section
  final String displayText;

  /// Whether to allow more than one selected filter. Defaults to false.
  final bool multiSelect;

  /// {@macro FilterSection}
  const FilterSectionModel({
    required this.identifier,
    required this.filterItems,
    required this.displayText,
    this.multiSelect = false,
  });

  @override
  List<Object?> get props => [
        identifier,
        filterItems,
        displayText,
        multiSelect,
      ];

  /// Connect the generated [_$FilterSectionModelFromJson] function to the `fromJson`
  /// factory.
  factory FilterSectionModel.fromJson(final Map<String, dynamic> json) =>
      _$FilterSectionModelFromJson(json);

  /// Connect the generated [_$FilterSectionModel] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FilterSectionModelToJson(this);
}
