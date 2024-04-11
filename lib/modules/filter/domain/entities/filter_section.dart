import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'filter_item.dart';

part 'filter_section.g.dart';

/// {@template FilterSection}
/// A collection of [FilterItem] objects
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class FilterSection extends Equatable {
  /// Object property identifier, e.g. userID or messageID
  final String identifier;

  /// Value used when filtering, as opposed to [displayText] value
  final List<FilterItem> filterItems;

  /// User-facing text to describe the section
  final String displayText;

  /// Whether to allow more than one selected filter. Defaults to false.
  final bool multiSelect;

  /// How to display the options and allow the user to select filters
  final String itemDisplayFormat;

  /// {@macro FilterSection}
  const FilterSection({
    required this.identifier,
    required this.filterItems,
    required this.displayText,
    required this.itemDisplayFormat,
    this.multiSelect = false,
  });

  /// update selection status for a filter item
  void update(
    final FilterItem filterItem, {
    final bool selected = false,
  }) {
    final updatedItems = filterItems.map((final e) {
      if (!multiSelect && e != filterItem) {
        return FilterItem(
            key: e.key, value: e.value, displayText: e.displayText);
      } else {
        if (e == filterItem) {
          return FilterItem(
            key: e.key,
            value: e.value,
            displayText: e.displayText,
            selected: selected,
          );
        } else {
          return e;
        }
      }
    });
    filterItems..clear()
    ..addAll(updatedItems);
  }

  @override
  List<Object?> get props => [
        identifier,
        filterItems,
        displayText,
        multiSelect,
        itemDisplayFormat,
      ];

  /// Connect the generated [_$FilterSectionFromJson] function to the `fromJson`
  /// factory.
  factory FilterSection.fromJson(final Map<String, dynamic> json) =>
      _$FilterSectionFromJson(json);

  /// Connect the generated [_$FilterSection] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FilterSectionToJson(this);
}
