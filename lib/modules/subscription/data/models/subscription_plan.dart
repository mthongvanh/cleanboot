// File: lib/modules/subscription/domain/models/subscription_plan.dart
class SubscriptionPlan {
  final String id;
  final String name;
  final double price;
  final String description;

  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });
}
