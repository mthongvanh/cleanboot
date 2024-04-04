import 'package:json_annotation/json_annotation.dart';

import '../../../../core/domain/user.dart';

part 'authed_user.g.dart';

/// {@template AuthedUser}
/// Authenticated user that extends the [User] base class
///
/// [User] class:
/// {@macro User}
/// {@endtemplate}
@JsonSerializable()
class AuthedUser extends User {
  /// {@macro AuthedUser}
  const AuthedUser({
    required super.identifier,
    required super.email,
    required super.username,
  });


  /// Connect the generated [_$AuthedUserFromJson] function to the `fromJson`
  /// factory.
  factory AuthedUser.fromJson(final Map<String, dynamic> json) =>
      _$AuthedUserFromJson(json);

  /// Connect the generated [_$AuthedUserToJson] function to the `toJson` method.
  @override
  Map<String, dynamic> toJson() => _$AuthedUserToJson(this);

  @override
  List<Object?> get props => [
    identifier,
    email,
    username,
  ];
}
