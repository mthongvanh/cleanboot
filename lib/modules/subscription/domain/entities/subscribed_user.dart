import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';

import '../../../../core/domain/user.dart';
import '../../../auth/auth.dart';

part 'subscribed_user.g.dart';

/// {@template SubscribedUser}
/// Subscribed user that extends the [SubscribedUser] base class, including subscription details
///
/// [User] class:
/// {@macro User}
/// {@endtemplate}
@JsonSerializable()
class SubscribedUser extends AuthedUser with EquatableMixin {
  /// Indicates whether the user is an active subscriber
  final bool isActiveSubscriber;

  /// List of entitlements the user has access to
  final List<String>? entitlements;

  /// {@macro SubscribedUser}
  const SubscribedUser({
    required super.identifier,
    required super.email,
    required super.username,
    required super.anonymous,
    required this.isActiveSubscriber,
    this.entitlements,
  });

  /// Connect the generated [_$SubscribedUserFromJson] function to the `fromJson`
  /// factory.
  factory SubscribedUser.fromJson(Map<String, dynamic> json) =>
      _$SubscribedUserFromJson(json);

  /// Connect the generated [_$SubscribedUserToJson] function to the `toJson` method.
  @override
  Map<String, dynamic> toJson() => _$SubscribedUserToJson(this);

  @override
  List<Object?> get props => [
    identifier,
    email,
    username,
    anonymous,
    isActiveSubscriber,
    entitlements,
  ];

  // static Future<SubscribedUser> fromRevenueCatUserInfo(CustomerInfo userInfo) {}
}
