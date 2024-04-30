
// Ensure all implementations of Entitlement have constant constructors
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'entitlement_model.g.dart';

@JsonSerializable()
class EntitlementModel extends Equatable {
  final String id;
  final bool isActive;

  const EntitlementModel({
    required this.id,
    required this.isActive,
  });



  factory EntitlementModel.fromJson(Map<String, dynamic> json) {
    return _$EntitlementModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$EntitlementModelToJson(this);



  @override
  List<Object> get props => [id, isActive];
}
