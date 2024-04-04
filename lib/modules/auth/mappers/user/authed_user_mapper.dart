import '../../../../cleanboot.dart';
import '../../data/models/authed_user_model.dart';
import '../../domain/entities/authed_user.dart';

class _AuthedUserModelToEntityMapper
    extends Mapper<AuthedUserModel, AuthedUser> {
  @override
  AuthedUserModel fromEntity(final AuthedUser entity) => AuthedUserModel(
        identifier: entity.identifier,
        email: entity.email,
        username: entity.username,
      );

  @override
  AuthedUser toEntity(final AuthedUserModel model) => AuthedUser(
        identifier: model.identifier,
        email: model.email,
        username: model.username,
      );
}

/// Maps a [AuthedUserModel ] to a [AuthedUser] entity
extension AuthedUserModelExt on AuthedUserModel {
  /// Maps a [AuthedUserModel ] to a [AuthedUser] entity
  AuthedUser get toEntity => _AuthedUserModelToEntityMapper().toEntity(this);
}

/// Maps a [AuthedUser] entity to a [AuthedUserModel ]
extension AuthedUserEntityExt on AuthedUser {
  /// Maps a [AuthedUser] entity to a [AuthedUserModel ]
  AuthedUserModel get toModel =>
      _AuthedUserModelToEntityMapper().fromEntity(this);
}
