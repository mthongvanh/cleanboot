import '../../../../cleanboot.dart';

class _UserModelToEntityMapper extends Mapper<UserModel, User> {
  @override
  UserModel fromEntity(final User entity) => UserModel(
    identifier: entity.identifier,
    email: entity.email,
    username: entity.username,
  );

  @override
  User toEntity(final UserModel model) => User(
    identifier: model.identifier,
    email: model.email,
    username: model.username,
  );
}

/// Maps a [UserModel] to a [User] entity
extension UserModelExt on UserModel {
  /// Maps a [UserModel] to a [User] entity
  User get toEntity => _UserModelToEntityMapper().toEntity(this);
}

/// Maps a [User] entity to a [UserModel]
extension UserEntityExt on User {
  /// Maps a [User] entity to a [UserModel]
  UserModel get toModel => _UserModelToEntityMapper().fromEntity(this);
}
