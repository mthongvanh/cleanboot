import 'package:flutter/cupertino.dart';

import '../../../../../cleanboot.dart';


/// Provides values to display on the [Login]
class LoginPageViewModel extends ViewModel<LoginPage> {

  /// User identifier (e-mail) entered in the text editing controller
  String userIdentifier = '';

  /// User secret (password) entered in the text editing controller
  String userSecret = '';

  /// Whether the secret is displayed in plain text or obscured
  final secretVisible = ValueNotifier(false);

  /// Page title displayed in the scaffold's title bar
  final String title;

  /// Provides values to display on the [Login]
  LoginPageViewModel(this.title);
}
