import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// {@template User}
/// Represents an application user
/// {@endtemplate}
@JsonSerializable()
class User extends Equatable {
  /// {@template User.identifier}
  /// Unique identifier assigned to the user
  /// {@endtemplate}
  final String? identifier;

  /// {@template User.email}
  /// User's registered e-mail address
  /// {@endtemplate}
  final String? email;

  /// {@template User.username}
  /// User-facing user identifier
  /// {@endtemplate}
  final String? username;

  /// {@macro User}
  const User({
    required this.identifier,
    required this.email,
    required this.username,
  });


  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(final Map<String, dynamic> json) =>
      _$UserFromJson(json);

  /// Connect the generated [_$User] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
    identifier,
    email,
    username,
  ];
}
