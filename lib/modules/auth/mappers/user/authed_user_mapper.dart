import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../../../cleanboot.dart';

class _AuthedUserModelToEntityMapper
    extends Mapper<AuthedUserModel, AuthedUser> {
  AuthedUserModel fromFirestore(final firebase.User user) {
    return AuthedUserModel(
      identifier: user.uid,
      email: user.email,
      username: user.displayName,
      anonymous: user.isAnonymous,
    );
  }

  @override
  AuthedUserModel fromEntity(final AuthedUser entity) => AuthedUserModel(
        identifier: entity.identifier,
        email: entity.email,
        username: entity.username,
        anonymous: entity.anonymous,
      );

  @override
  AuthedUser toEntity(final AuthedUserModel model) => AuthedUser(
        identifier: model.identifier,
        email: model.email,
        username: model.username,
        anonymous: model.anonymous,
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

/// Maps a [UserCredential] from Firebase to an [AuthedUserModel]
extension AuthedUserModelFirestoreExt on firebase.User {
  /// Maps a [UserCredential] from Firebase to a [AuthedUserModel]
  AuthedUserModel get toModel {
    return _AuthedUserModelToEntityMapper().fromFirestore(this);
  }
}
