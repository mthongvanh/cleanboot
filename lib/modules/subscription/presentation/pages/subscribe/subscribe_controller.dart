import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import '../../../../../cleanboot.dart';
import '../../../domain/params/purchase_params.dart';
import '../../../domain/use_cases/get_subscription_status_use_case.dart';
import '../../../domain/use_cases/purchase_subscription_use_case.dart';
import 'subscribe_page.dart';
import 'subscribe_view_model.dart';

/// Controls values on a view model to update widgets
class SubscribePageController extends Controller<SubscribePage> {
  /// Holds values for [SubscribePage] widgets
  final SubscribePageViewModel _viewModel;

  /// Text controller for the subscription plan field
  final subscriptionPlanController = TextEditingController();

  /// Purchase a subscription
  final PurchaseSubscriptionUseCase purchaseSubscriptionUseCase;

  final GetSubscriptionStatusUseCase getSubscriptionStatus;

  final GetAuthedUserUseCase getAuthedUserUseCase;

  /// Creates a new instance of [SubscribePageController]
  SubscribePageController(
      this._viewModel,
      super.navigator, {
        required this.purchaseSubscriptionUseCase,
        required this.getSubscriptionStatus,
        required this.getAuthedUserUseCase,
      });

  /// Validates whether the chosen subscription plan is valid
  bool validateSubscriptionPlan(final String? plan) {
    return plan != null && plan.isNotEmpty;
  }


  Future<void> init() async {
    await getAuthedUser();
    await getStatus();
  }

  Future <void> getStatus()  async {
    final response = await getSubscriptionStatus.execute(SubscriptionParams(userId: viewModel.userId, entitlementId: ""));
    if (response.result != null) {

      print(response.result.toString());
    } else {
      _onError(response.failure);
    }

  }

  Future <void> getAuthedUser()  async {
    final response = await getAuthedUserUseCase.execute(NoParams());
    if (response.result != null) {
      viewModel.userId = response.result!.identifier!;
    }
  }

  /// Send a request to purchase a subscription
  Future<void> subscribe() async {
    if (!viewModel.loading.value) {
      viewModel.loading.value = true;
      final response = await purchaseSubscriptionUseCase.execute(
        PurchaseParams(
          userId: viewModel.userId, // Assuming this is set somewhere in your ViewModel
          subscriptionId: subscriptionPlanController.text, entitlementId: '',
        ),
      );

      if (response.result != null) {
        // Display success message
        viewModel.subscriptionResponseState.value = SubscriptionState.success;
      } else {
        _onError(response.failure);
      }
      viewModel.loading.value = false;
    }
  }

  void _onError(final Failure? failure) =>
      viewModel.error.value = failure ?? const Failure();

  /// Navigate to the main content screen
  void navigateHome(final BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop(SubscriptionState.success);
  }

  @override
  SubscribePageViewModel get viewModel => _viewModel;
}
