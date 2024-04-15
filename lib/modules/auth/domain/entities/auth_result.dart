import 'package:equatable/equatable.dart';

import '../../../../cleanboot.dart';

/// {@template AuthResult}
/// Local representation of an authentication result
/// {@endtemplate}
class AuthResult extends Equatable {
  /// Authentication token returned by the authentication service
  final String? token;

  /// User associated to the AuthResult
  final AuthedUserModel? user;

  /// {@macro AuthResult}
  const AuthResult({
    this.token,
    this.user,
  });

  @override
  List<Object?> get props => [
        token,
        user,
      ];
}
