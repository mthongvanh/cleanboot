import '../../../../cleanboot.dart';

/// {@template SubscriptionResultModel}
/// External representation of a subscription result
/// {@endtemplate}
class SubscriptionResultModel extends SubscriptionResult {
  /// {@macro SubscriptionResultModel}
  const SubscriptionResultModel({
    super.isActive,
    super.entitlements,
  });

  /// Application representation of remote model's json representation
  SubscriptionResultModel fromJson(final Map<String, Object?> json) {
    return SubscriptionResultModel(
      isActive: json['isActive'] as bool?,
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
  /// {@macro EntitlementModel}
  const EntitlementModel({
    required this.id,
    required this.isActive,
  });

  /// Constructs an `EntitlementModel` from JSON
  factory EntitlementModel.fromJson(Map<String, dynamic> json) {
    return EntitlementModel(
      id: json['id'] as String,
      isActive: json['isActive'] as bool,
    );
  }

  /// The unique identifier for the entitlement
  final String id;

  /// Whether this entitlement is currently active
  final bool isActive;

  /// Converts an `EntitlementModel` to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isActive': isActive,
    };
  }

  @override
  List<Object> get props => [
    id,
    isActive,
  ];
}
