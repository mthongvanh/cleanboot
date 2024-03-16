import 'package:equatable/equatable.dart';

/// {@template AuthParams}
/// Provides values used to perform various methods of authentication
/// {@endtemplate}
class AuthParams with EquatableMixin {
  /// User or account identifier
  final String? identifier;

  /// Password or token used to verify authenticity of user
  final String? secret;

  /// {@macro AuthParams}
  AuthParams({
    required this.identifier,
    required this.secret,
  });

  @override
  List<Object?> get props => [
        identifier,
        secret,
      ];
}
