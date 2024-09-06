import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'display_name_model.g.dart';

/// {@template DisplayName}
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class DisplayNameModel extends Equatable {
  /// {@macro DisplayName.identifier}
  final String identifier;

  /// {@macro DisplayName.createdOn}
  final int createdOn;

  /// {@macro DisplayName.displayName}
  final String displayName;

  /// {@macro DisplayName.userUid}
  final String userUid;

  /// {@macro DisplayName}
  const DisplayNameModel({
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

  @override
  String toString() {
    return '${super.toString()}: identifier: $identifier, createdOn: $createdOn, displayName: $displayName, userUid: $userUid';
  }

  /// Connect the generated [_$DisplayNameModelFromJson] function to the `fromJson`
  /// factory.
  factory DisplayNameModel.fromJson(final Map<String, dynamic> json) =>
      _$DisplayNameModelFromJson(json);

  /// Connect the generated [_$DisplayName] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DisplayNameModelToJson(this);
}
