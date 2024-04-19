import 'package:purchases_flutter/purchases_flutter.dart' as purchases;

import '../../../../cleanboot.dart';
import '../../data/models/subscribed_user_model.dart';
import '../../domain/entities/subscribed_user.dart';

class _SubscribedUserModelToEntityMapper
    extends Mapper<SubscribedUserModel, SubscribedUser> {
  SubscribedUserModel fromPurchaserInfo(final purchases.CustomerInfo info) {
    return SubscribedUserModel(
      identifier: info.originalAppUserId,
      email: '', // Email is not directly available from PurchaserInfo
      username: info.originalAppUserId, // Using user ID as username for simplification
      anonymous: false, // Subscription systems generally do not have anonymous users
      isActiveSubscriber: info.entitlements.active.isNotEmpty,
      entitlements: info.entitlements.active.keys.toList(),
    );
  }

  @override
  SubscribedUserModel fromEntity(final SubscribedUser entity) => SubscribedUserModel(
    identifier: entity.identifier,
    email: entity.email,
    username: entity.username,
    anonymous: entity.anonymous,
    isActiveSubscriber: entity.isActiveSubscriber,
    entitlements: entity.entitlements,
  );

  @override
  SubscribedUser toEntity(final SubscribedUserModel model) => SubscribedUser(
    identifier: model.identifier,
    email: model.email,
    username: model.username,
    anonymous: model.anonymous,
    isActiveSubscriber: model.isActiveSubscriber!,
    entitlements: model.entitlements,
  );
}

/// Maps a [SubscribedUserModel] to a [SubscribedUser] entity
extension SubscribedUserModelExt on SubscribedUserModel {
  /// Maps a [SubscribedUserModel] to a [SubscribedUser] entity
  SubscribedUser get toEntity => _SubscribedUserModelToEntityMapper().toEntity(this);
}

/// Maps a [SubscribedUser] entity to a [SubscribedUserModel]
extension SubscribedUserEntityExt on SubscribedUser {
  /// Maps a [SubscribedUser] entity to a [SubscribedUserModel]
  SubscribedUserModel get toModel =>
      _SubscribedUserModelToEntityMapper().fromEntity(this);
}

/// Maps PurchaserInfo from RevenueCat to a [SubscribedUserModel]
extension PurchaserInfoToModelExt on purchases.CustomerInfo {
  /// Maps PurchaserInfo to a [SubscribedUserModel]
  SubscribedUserModel toModel() {
    return _SubscribedUserModelToEntityMapper().fromPurchaserInfo(this);
  }
}
