import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_item.g.dart';

/// {@template FilterItem}
/// A filter option shown to the user
/// {@endtemplate}
@JsonSerializable()
class FilterItem extends Equatable {
  /// Object property identifier, e.g. userID or messageID
  final String? key;

  /// Value used when filtering, as opposed to [displayText] value
  final Object value;

  /// User-facing text to describe the value
  final String displayText;

  /// Whether the filter has been selected
  final bool selected;

  /// {@macro FilterItem}
  const FilterItem({
    this.key,
    required this.value,
    required this.displayText,
    this.selected = false,
  });

  /// Property values
  @override
  List<Object?> get props => [
        key,
        value,
        displayText,
        selected,
      ];

  /// Connect the generated [_$FilterItemFromJson] function to the `fromJson`
  /// factory.
  factory FilterItem.fromJson(final Map<String, dynamic> json) =>
      _$FilterItemFromJson(json);

  /// Connect the generated [_$FilterItem] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FilterItemToJson(this);
}
