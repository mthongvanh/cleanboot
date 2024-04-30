import 'package:flutter/cupertino.dart';

import '../../../../../cleanboot.dart';
import '../../../data/models/subscription_plan.dart';
import '../../../domain/enums/subscription_state.dart';
import 'subscribe_page.dart';

/// Provides values to display on the [SubscribePage]
class SubscribePageViewModel extends ViewModel<SubscribePage> {
  /// Current selected plan ID
  final selectedPlanId = ValueNotifier<String?>(null);

  String userId = '';

  /// List of available plans to subscribe to
  final List<SubscriptionPlan> planOptions;

  /// Status of the subscription request
  final subscriptionResponseState = ValueNotifier<SubscriptionState>(
    SubscriptionState.initialized,
  );

  SubscribePageViewModel({required this.planOptions});

  /// Selects a plan based on the given plan ID
  void selectPlan(String planId) {
    selectedPlanId.value = planId;
  }
}
