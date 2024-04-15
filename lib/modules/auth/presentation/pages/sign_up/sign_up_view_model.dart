import 'package:flutter/cupertino.dart';

import '../../../../../cleanboot.dart';

import 'sign_up_page.dart';

/// Provides values to display on the [SignUp]
class SignUpPageViewModel extends ViewModel<SignUpPage> {
  /// Current authed user's display name
  String? currentDisplayName;

  /// List of existing display names
  final List<String> displayNames = [];

  /// Whether the password contains a special character
  final secret = ValueNotifier('');

  /// Status of the sign-up request
  final signUpResponseState = ValueNotifier<SignUpResponseState>(
    SignUpResponseState.initialized,
  );

  /// Whether the text field obscures text
  final passwordObscured = ValueNotifier(true);
}
