abstract class Entitlement {
  const Entitlement();  // Added `const` constructor

  String get id;
  bool get isActive;

  Map<String, dynamic> toJson();
}

// Ensure all implementations of Entitlement have constant constructors
class EntitlementModel extends Entitlement {
  final String id;
  final bool isActive;

  const EntitlementModel({
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
}
