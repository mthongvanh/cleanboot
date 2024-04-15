import '../../../../cleanboot.dart';

/// {@template AuthResultModel}
/// External representation of an authentication result
/// {@endtemplate}
class AuthResultModel extends AuthResult {
  /// {@macro AuthResulModel}
  const AuthResultModel({
    super.token,
    super.user,
  });

  /// Application representation of remote model's json representation
  AuthResultModel fromJson(final Map<String, Object?> json) {
    return AuthResultModel(
      token: json['token'] as String?,
      user: AuthedUserModel.fromJson(json['user'] as Map<String, dynamic>? ?? {}),
    );
  }

  /// Json representation of the model
  Map<String, Object?> toJson() {
    return <String, Object?>{
      'token': token,
      'user': user?.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        token,
        user,
      ];
}
