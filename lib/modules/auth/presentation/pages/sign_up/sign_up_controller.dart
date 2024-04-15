import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../../../../cleanboot.dart';

import '../../../domain/params/sign_up_params.dart';
import '../../../domain/use_cases/sign_up_use_case.dart';
import 'sign_up_page.dart';
import 'sign_up_view_model.dart';

/// Controls values on a view model to update widgets
class SignUpPageController extends Controller<SignUpPage> {
  /// Holds values for [SignUpPage] widgets
  final SignUpPageViewModel _viewModel;

  /// Text controller for the email field
  final emailController = TextEditingController();

  /// Text controller for the display name field
  final displayNameController = TextEditingController();

  /// Text controller for the password field
  final passwordController = TextEditingController();

  /// Text controller for the confirm password field
  final confirmPasswordController = TextEditingController();

  /// Sign a user up with a service
  final SignUpUseCase signUpUseCase;

  /// Get display names
  final GetDisplayNamesUseCase getDisplayNamesUseCase;

  /// Get authed user
  final GetAuthedUserUseCase getAuthedUserUseCase;

  /// Creates a new instance of [SignUpPageController]
  SignUpPageController(
    this._viewModel,
    super.navigator, {
    required this.signUpUseCase,
    required this.getDisplayNamesUseCase,
    required this.getAuthedUserUseCase,
  });

  /// Perform some initialization steps
  @override
  Future<void> init() async {
    await _loadDisplayNames();
    await _getAuthedUser();
    return;
  }

  Future<void> _loadDisplayNames() async {
    final response = await getDisplayNamesUseCase.execute(
      GetDisplayNamesParams(
        cacheType: 'server',
      ),
    );
    if (response.result != null) {
      viewModel.displayNames.addAll(response.result!);
    } else {
      _onError(response.failure);
    }
  }

  Future<void> _getAuthedUser() async {
    final response = await getAuthedUserUseCase.execute(NoParams());
    if (response.result != null) {
      viewModel.currentDisplayName = response.result!.username;
      displayNameController.text = response.result!.username ?? '';
    }
  }

  /// Validates whether the password meets the criteria
  String? validatePassword(final String? password) {
    for (final bool Function(String) isValid in [
      validLength,
      containsCapital,
      validNumber,
      validCharacter,
    ]) {
      if (!isValid(password ?? '')) {
        return 'Please enter a valid password';
      }
    }
    return null;
  }

  /// Whether the password is long enough
  bool validLength(final String input) => _validator(input, r'^.{6,}$');

  /// Whether the password contains a capital letter
  bool containsCapital(final String input) => _validator(input, r'.*?[A-Z]');

  /// Whether the password contains a number
  bool validNumber(final String input) => _validator(input, r'.*?[0-9]');

  /// Whether the password contains a special character
  bool validCharacter(final String input) =>
      _validator(input, r'.*?[#?!@$%^&*-]');

  /// Whether the password and confirm password field match
  bool passwordsMatch(final String input) =>
      (passwordController.text == confirmPasswordController.text) &&
      passwordController.text.isNotEmpty;

  bool _validator(final String input, final String pattern) {
    final regExp = RegExp(pattern);
    return regExp.hasMatch(input);
  }

  /// Whether a display name already exists in the system
  bool uniqueDisplayName(final String displayName) {
    return _viewModel.displayNames
        .where(
          (final element) =>
              element.toLowerCase() == displayName.toLowerCase() &&
              element.toLowerCase() != viewModel.currentDisplayName,
        )
        .isEmpty;
  }

  /// Show/hide the password in plain text
  void togglePasswordVisibility() {
    viewModel.passwordObscured.value = !viewModel.passwordObscured.value;
  }

  /// Send a request to sign a user up
  Future<void> signUp() async {
    if (!viewModel.loading.value) {
      viewModel.loading.value = true;
      final response = await signUpUseCase.execute(
        SignUpParams(
          identifier: emailController.text,
          secret: passwordController.text,
          displayName: displayNameController.text,
        ),
      );

      if (response.result != null) {
        // display success message
        viewModel.signUpResponseState.value = SignUpResponseState.success;
      } else {
        _onError(response.failure);
      }
      viewModel.loading.value = false;
    }
  }

  void _onError(final Failure? failure) =>
      viewModel.error.value = failure ?? const Failure();

  /// navigate to the root content screen
  void navigateHome(final BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop(SignUpResponseState.success);
  }

  @override
  SignUpPageViewModel get viewModel => _viewModel;
}
