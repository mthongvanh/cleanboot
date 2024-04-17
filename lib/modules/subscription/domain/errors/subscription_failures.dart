// File: lib/modules/subscription/domain/errors/subscription_failures.dart

import '../../../../cleanboot.dart';  // Import path might need to be adjusted based on your project structure

class SubscriptionFailure extends Failure {
  SubscriptionFailure({String? message}) : super(description: message);

  factory SubscriptionFailure.cancellationFailed({String? description}) {
    return SubscriptionFailure(message: description ?? "Failed to cancel subscription.");
  }
}
