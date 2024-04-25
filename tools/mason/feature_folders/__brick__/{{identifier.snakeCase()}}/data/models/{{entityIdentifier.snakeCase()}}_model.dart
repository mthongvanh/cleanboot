import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{entityIdentifier.snakeCase()}}_model.g.dart';

/// {@template {{entityIdentifier.pascalCase()}}}
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class {{entityIdentifier.pascalCase()}}Model extends Equatable {
  /// {@macro {{entityIdentifier.pascalCase()}}.identifier}
  final String identifier;

  /// {@macro {{entityIdentifier.pascalCase()}}}
  const {{entityIdentifier.pascalCase()}}Model({
    required this.identifier,
  });

  @override
  List<Object?> get props => [
    identifier,
  ];

  /// Connect the generated [_${{entityIdentifier.pascalCase()}}ModelFromJson] function to the `fromJson`
  /// factory.
  factory {{entityIdentifier.pascalCase()}}Model.fromJson(final Map<String, dynamic> json) =>
  _${{entityIdentifier.pascalCase()}}ModelFromJson(json);

  /// Connect the generated [_${{entityIdentifier.pascalCase()}}] function to the `toJson` method.
  Map<String, dynamic> toJson() => _${{entityIdentifier.pascalCase()}}ModelToJson(this);
}
