import '../../../../../cleanboot.dart';


/// Provides values to display on the [Login]
class LoginPageViewModel extends ViewModel<LoginPage> {

  /// User identifier (e-mail) entered in the text editing controller
  String userIdentifier = '';

  /// User secret (password) entered in the text editing controller
  String userSecret = '';

}
