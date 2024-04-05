import 'package:json_annotation/json_annotation.dart';

import '../../../../core/domain/user.dart';

part 'authed_user_model.g.dart';

/// {@template AuthedUserModel}
/// Authenticated user that extends the [User] base class
///
/// [User] class:
/// {@macro User}
/// {@endtemplate}
@JsonSerializable()
class AuthedUserModel extends User {
  /// {@macro AuthedUserModel}
  const AuthedUserModel({
    required super.identifier,
    required super.email,
    required super.username,
    required super.anonymous,
  });


  /// Connect the generated [_$AuthedUserModelFromJson] function to the `fromJson`
  /// factory.
  factory AuthedUserModel.fromJson(final Map<String, dynamic> json) =>
      _$AuthedUserModelFromJson(json);

  /// Connect the generated [_$AuthedUserModelToJson] function to the `toJson` method.
  @override
  Map<String, dynamic> toJson() => _$AuthedUserModelToJson(this);

  @override
  List<Object?> get props => [
    identifier,
    email,
    username,
    anonymous,
  ];
}
