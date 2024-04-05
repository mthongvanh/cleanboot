import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

/// {@macro User}
@JsonSerializable()
class UserModel extends Equatable {
  /// {@macro User.identifier}
  final String? identifier;

  /// {@macro User.email}
  final String? email;

  /// {@macro User.username}
  final String? username;

  /// {@macro User.anonymous}
  final bool anonymous;


  /// {@macro User}
  const UserModel({
    required this.identifier,
    required this.email,
    required this.username,
    required this.anonymous,
  });


  /// Connect the generated [_$UserModelFromJson] function to the `fromJson`
  /// factory.
  factory UserModel.fromJson(final Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Connect the generated [_$UserModel] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
    identifier,
    email,
    username,
    anonymous,
  ];
}
