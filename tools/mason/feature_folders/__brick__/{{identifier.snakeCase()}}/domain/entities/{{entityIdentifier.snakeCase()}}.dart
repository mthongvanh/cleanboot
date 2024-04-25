import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{entityIdentifier.snakeCase()}}.g.dart';

/// {@template {{entityIdentifier.pascalCase()}}}
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class {{entityIdentifier.pascalCase()}} extends Equatable {
  /// {@template {{entityIdentifier.pascalCase()}}.identifier}
  /// Unique identifier for a [{{entityIdentifier.pascalCase()}}] object
  /// {@endtemplate}
  final String identifier;

  /// {@macro {{entityIdentifier.pascalCase()}}}
  const {{entityIdentifier.pascalCase()}}({
    required this.identifier,
  });

  @override
  List<Object?> get props => [
    identifier,
  ];

  /// Connect the generated [_${{entityIdentifier.pascalCase()}}FromJson] function to the `fromJson`
  /// factory.
  factory {{entityIdentifier.pascalCase()}}.fromJson(final Map<String, dynamic> json) =>
      _${{entityIdentifier.pascalCase()}}FromJson(json);

  /// Connect the generated [_${{entityIdentifier.pascalCase()}}] function to the `toJson` method.
  Map<String, dynamic> toJson() => _${{entityIdentifier.pascalCase()}}ToJson(this);
}
