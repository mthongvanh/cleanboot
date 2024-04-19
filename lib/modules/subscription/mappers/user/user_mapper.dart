import '../../../../cleanboot.dart';

class _UserModelToEntityMapper extends Mapper<UserModel, User> {
  @override
  UserModel fromEntity(final User entity) => UserModel(
    identifier: entity.identifier,
    email: entity.email,
    username: entity.username,
    anonymous: entity.anonymous,
    isActiveSubscriber: entity.isActiveSubscriber!, // New field
    entitlements: entity.entitlements, // New field
  );

  @override
  User toEntity(final UserModel model) => User(
    identifier: model.identifier,
    email: model.email,
    username: model.username,
    anonymous: model.anonymous,
    isActiveSubscriber: model.isActiveSubscriber,
    entitlements: model.entitlements,
  );
}

/// Maps a [UserModel] to a [User] entity
extension UserModelExt on UserModel {
  User get toEntity => _UserModelToEntityMapper().toEntity(this);
}

/// Maps a [User] entity to a [UserModel]
extension UserEntityExt on User {
  UserModel get toModel => _UserModelToEntityMapper().fromEntity(this);
}

/// Extension to map PurchaserInfo to UserModel
extension PurchaserInfoToUserModelExt on PurchaserInfo {
  UserModel toUserModel() {
    return UserModel(
      identifier: this.originalAppUserId, // Typically the user ID in your system
      email: '', // Email might not be provided by PurchaserInfo
      username: this.originalAppUserId, // Simplified assumption
      anonymous: false, // Typically users with subscriptions are not anonymous
      isActiveSubscriber: this.entitlements.active.isNotEmpty,
      entitlements: this.entitlements.active.values.map((e) => e.identifier).toList(),
    );
  }
}
