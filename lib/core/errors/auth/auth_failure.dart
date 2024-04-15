import '../failures.dart';

/// {@template AuthFailure}
/// Describes a failure encountered during the authentication process
/// {@endtemplate}
class AuthFailure extends Failure {
  const AuthFailure._({
    super.description,
    super.reason,
    super.code,
  });

  /// Auth credentials were invalid
  factory AuthFailure.invalidCredentials({
    final String? description,
    final String? reason,
  }) =>
      AuthFailure._(
        description: description ?? 'Login failed (8000)',
        reason: reason ?? 'Login failed due to invalid credentials',
        code: 8000,
      );

  /// Sign up failed
  factory AuthFailure.signUp({
    final String? description,
    final String? reason,
  }) =>
      AuthFailure._(
        description: description ?? 'Sign up failed (8001)',
        reason: reason ?? 'Sign up failed',
        code: 8001,
      );
}
