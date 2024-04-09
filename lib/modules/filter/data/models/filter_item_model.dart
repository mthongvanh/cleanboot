import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_item_model.g.dart';

/// {@macro FilterItem}
@JsonSerializable()
class FilterItemModel extends Equatable {
  /// Object property identifier, e.g. userID or messageID
  final String? key;

  /// Value used when filtering, as opposed to [displayText] value
  final Object value;

  /// User-facing text to describe the value
  final String displayText;

  /// {@macro FilterItem}
  const FilterItemModel({
    this.key,
    required this.value,
    required this.displayText,
  });

  @override
  List<Object?> get props => [
    key,
    value,
    displayText,
  ];

  /// Connect the generated [_$FilterItemModelFromJson] function to the `fromJson`
  /// factory.
  factory FilterItemModel.fromJson(final Map<String, dynamic> json) =>
      _$FilterItemModelFromJson(json);

  /// Connect the generated [_$FilterItemModel] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FilterItemModelToJson(this);
}
