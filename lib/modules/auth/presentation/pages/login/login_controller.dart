import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../../../../cleanboot.dart';
import '../sign_up/sign_up_page.dart';
import '../sign_up/sign_up_view_model.dart';

/// Controls values on a view model to update widgets
class LoginPageController extends Controller<LoginPage> {
  /// Holds values for [LoginPage] widgets
  final LoginPageViewModel _viewModel;

  /// Authenticates the user
  final SignInUseCase signInUseCase;

  /// Controller for the user identifier field (username)
  final identifierEditingController = TextEditingController();

  /// Controller for the user secret field (password)
  final secretEditingController = TextEditingController();

  /// Creates a new instance of [LoginPageController]
  LoginPageController(
    this._viewModel,
    super.navigator, {
    required this.signInUseCase,
  });

  /// Perform some initialization steps
  @override
  Future<void> init() async {
    return;
  }

  void _onError(final Failure? failure) => viewModel.error.value = failure ??
      const Failure(
        description: 'Login failed',
      );

  /// Perform login
  Future<void> login(final BuildContext context) async {
    final response = await signInUseCase.execute(
      AuthParams(
        identifier: identifierEditingController.text,
        secret: secretEditingController.text,
      ),
    );

    if (response.result != null) {
      Navigator.of(context).pop();
    } else {
      _onError(response.failure);
    }
  }

  /// Navigate to sign-up
  Future<void> navigateToSignUp(final BuildContext context) async {
    final result = await navigator.push<SignUpResponseState?>(
      context,
      routeIdentifier: SignUpPage.name,
    );
    if (result == SignUpResponseState.success) {
      Navigator.of(context).pop();
    }
  }

  @override
  LoginPageViewModel get viewModel => _viewModel;
}
