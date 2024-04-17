import 'package:json_annotation/json_annotation.dart';

import '../../../../core/domain/user.dart';

part 'subscribed_user_model.g.dart';

/// {@template SubscribedUserModel}
/// Subscribed user that extends the [User] base class, including subscription details
///
/// [User] class:
/// {@macro User}
/// {@endtemplate}
@JsonSerializable()
class SubscribedUserModel extends User {
  /// {@macro SubscribedUserModel}
  const SubscribedUserModel({
    required super.identifier,
    required super.email,
    required super.username,
    required super.anonymous,
    this.isActiveSubscriber,
    this.entitlements,
  });

  /// Indicates whether the user is an active subscriber
  final bool? isActiveSubscriber;

  /// List of entitlements the user has access to
  final List<String>? entitlements;

  /// Connect the generated [_$SubscribedUserModelFromJson] function to the `fromJson`
  /// factory.
  factory SubscribedUserModel.fromJson(final Map<String, dynamic> json) =>
      _$SubscribedUserModelFromJson(json);

  /// Connect the generated [_$SubscribedUserModelToJson] function to the `toJson` method.
  @override
  Map<String, dynamic> toJson() => _$SubscribedUserModelToJson(this);

  @override
  List<Object?> get props => [
    identifier,
    email,
    username,
    anonymous,
    isActiveSubscriber,
    entitlements,
  ];
}
