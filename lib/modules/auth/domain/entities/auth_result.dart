import 'package:equatable/equatable.dart';

/// {@template AuthResult}
/// Local representation of an authentication result
/// {@endtemplate}
class AuthResult extends Equatable {
  /// Authentication token returned by the authentication service
  final String? token;

  /// {@macro AuthResult}
  const AuthResult({this.token});

  @override
  List<Object?> get props => [
        token,
      ];
}
