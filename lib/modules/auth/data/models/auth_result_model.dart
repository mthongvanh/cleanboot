import '../../domain/entities/auth_result.dart';

/// {@template AuthResultModel}
/// External representation of an authentication result
/// {@endtemplate}
class AuthResultModel extends AuthResult {
  /// {@macro AuthResulModel}
  const AuthResultModel({super.token});

  /// Application representation of remote model's json representation
  AuthResultModel fromJson(final Map<String, Object?> json) {
    return AuthResultModel(
      token: json['token'] as String?,
    );
  }

  /// Json representation of the model
  Map<String, Object?> toJson() {
    return <String, Object?>{
      'token': token,
    };
  }

  @override
  List<Object?> get props => [
        token,
      ];
}
