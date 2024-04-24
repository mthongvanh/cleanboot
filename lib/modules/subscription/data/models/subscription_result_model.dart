import '../../../../cleanboot.dart';
import 'entitlement_model.dart';

/// {@template SubscriptionResultModel}
/// External representation of a subscription result
/// {@endtemplate}
class SubscriptionResultModel extends SubscriptionResult {
  /// {@macro SubscriptionResultModel}
  const SubscriptionResultModel({
    required super.isActive,
    super.entitlements,
  });

  /// Application representation of remote model's json representation
  SubscriptionResultModel fromJson(final Map<String, Object?> json) {
    return SubscriptionResultModel(
      isActive: json['isActive'] as bool,
      entitlements: (json['entitlements'] as List<dynamic>?)
          ?.map((e) => EntitlementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Json representation of the model
  Map<String, Object?> toJson() {
    return <String, Object?>{
      'isActive': isActive,
      'entitlements': entitlements?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
    isActive,
    entitlements,
  ];
}

/// {@template EntitlementModel}
/// Model for an entitlement, representing access levels in subscriptions
/// {@endtemplate}
class EntitlementModel extends Entitlement {
  final String id;
  final bool isActive;

  // Removed `const` keyword
  EntitlementModel({
    required this.id,
    required this.isActive,
  });

  factory EntitlementModel.fromJson(Map<String, dynamic> json) {
    return EntitlementModel(
      id: json['id'] as String,
      isActive: json['isActive'] as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isActive': isActive,
    };
  }

  @override
  List<Object> get props => [id, isActive];

  toEntity() {}


}
