
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entitlement.g.dart';

/// Ensure all implementations of Entitlement have constant constructors
@JsonSerializable()
class Entitlement extends Equatable {
  final String id;
  final bool isActive;

  const Entitlement({
    required this.id,
    required this.isActive,
  });

  factory Entitlement.fromJson(Map<String, dynamic> json) {
    return _$EntitlementFromJson(json);

  }

  @override
  Map<String, dynamic> toJson() => _$EntitlementToJson(this);

  @override
  List<Object> get props => [id, isActive];
}



