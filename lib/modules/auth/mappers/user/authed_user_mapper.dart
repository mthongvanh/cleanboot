import 'package:firebase_auth/firebase_auth.dart';

import '../../../../cleanboot.dart';
import '../../data/models/authed_user_model.dart';
import '../../domain/entities/authed_user.dart';

class _AuthedUserModelToEntityMapper
    extends Mapper<AuthedUserModel, AuthedUser> {
  AuthedUserModel fromFirestore(final UserCredential firestoreCredentials) {
    return AuthedUserModel(
      identifier: firestoreCredentials.user?.uid,
      email: firestoreCredentials.user?.email,
      username: firestoreCredentials.user?.displayName,
    );
  }

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

/// Maps a [UserCredential] from Firebase to an [AuthedUserModel]
extension AuthedUserModelFirestoreExt on UserCredential {
  /// Maps a [UserCredential] from Firebase to a [AuthedUserModel]
  AuthedUserModel toModel() {
    return _AuthedUserModelToEntityMapper().fromFirestore(this);
  }
}
