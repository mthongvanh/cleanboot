import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'display_name.g.dart';

/// {@template DisplayName}
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class DisplayName extends Equatable {
  /// {@template DisplayName.identifier}
  /// Unique identifier for a [DisplayName] object
  /// {@endtemplate}
  final String identifier;

  /// {@template DisplayName.createdOn}
  /// When the record was created
  /// {@endtemplate}
  final int createdOn;

  /// {@template DisplayName.displayName}
  /// User-facing display name
  /// {@endtemplate}
  final String displayName;

  /// {@template DisplayName.userUid}
  /// User's unique identifier who created the display name
  /// {@endtemplate}
  final String userUid;

  /// {@macro DisplayName}
  const DisplayName({
    required this.identifier,
    required this.createdOn,
    required this.displayName,
    required this.userUid,
  });

  @override
  List<Object?> get props => [
        identifier,
        createdOn,
        displayName,
        userUid,
      ];

  /// Connect the generated [_$DisplayNameFromJson] function to the `fromJson`
  /// factory.
  factory DisplayName.fromJson(final Map<String, dynamic> json) =>
      _$DisplayNameFromJson(json);

  /// Connect the generated [_$DisplayName] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DisplayNameToJson(this);
}
