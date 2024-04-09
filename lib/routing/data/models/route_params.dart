import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_params.g.dart';

/// {@template RouteParams}
/// Contains data intended for use by the target route, such as user id or image
/// identifiers
/// {@endtemplate}
@JsonSerializable()
class RouteParams extends Equatable {
  /// An list of entity identifiers such as user id or message id
  final List<String>? entityIdentifiers;

  /// Contains a Map-representation of custom data
  final Map<String, Object>? customMap;

  /// {@macro RouteParams}
  const RouteParams({
    this.entityIdentifiers,
    this.customMap,
  });

  /// Connect the generated [_$RouteParamsFromJson] function to the `fromJson`
  /// factory.
  factory RouteParams.fromJson(final Map<String, dynamic> json) =>
      _$RouteParamsFromJson(json);

  /// Connect the generated [_$RouteParams] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RouteParamsToJson(this);

  @override
  List<Object?> get props => [
    entityIdentifiers,
    customMap,
  ];
}
