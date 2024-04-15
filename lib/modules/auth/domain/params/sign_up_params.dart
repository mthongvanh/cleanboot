import 'package:equatable/equatable.dart';

/// {@template SignUpParams}
/// Provides values used to sign up with a service
/// {@endtemplate}
class SignUpParams with EquatableMixin {
  /// User or account identifier
  final String? identifier;

  /// Password or token used to verify authenticity of user
  final String? secret;

  /// Name visible to other users
  final String? displayName;

  /// {@macro AuthParams}
  SignUpParams({
    required this.identifier,
    required this.secret,
    required this.displayName,
  });

  @override
  List<Object?> get props => [
    identifier,
    secret,
    displayName,
  ];
}
