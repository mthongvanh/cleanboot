import 'package:firebase_auth/firebase_auth.dart';

import '../../../../cleanboot.dart';

class _AuthResultModelToEntityMapper
    extends Mapper<AuthResultModel, AuthResult> {
  AuthResultModel fromFirestore(final AuthCredential firestoreCredentials) {
    return AuthResultModel(
      token: firestoreCredentials.token != null
          ? firestoreCredentials.token.toString()
          : firestoreCredentials.accessToken,
    );
  }

  @override
  AuthResultModel fromEntity(final AuthResult entity) => AuthResultModel(
        token: entity.token,
      );

  @override
  AuthResult toEntity(final AuthResultModel model) => AuthResult(
        token: model.token,
      );
}

/// Maps a [AuthResultModel ] to a [AuthResult] entity
extension AuthResultModelExt on AuthResultModel {
  /// Maps a [AuthResultModel ] to a [AuthResult] entity
  AuthResult get toEntity => _AuthResultModelToEntityMapper().toEntity(this);
}

/// Maps a [AuthResult] entity to a [AuthResultModel ]
extension AuthResultEntityExt on AuthResult {
  /// Maps a [AuthResult] entity to a [AuthResultModel ]
  AuthResultModel get toModel =>
      _AuthResultModelToEntityMapper().fromEntity(this);
}

/// Maps a [UserCredential] from Firebase to an [AuthResultModel]
extension AuthResultModelFirestoreExt on AuthCredential {
  /// Maps a [AuthCredential] from Firebase to a [AuthResultModel]
  AuthResultModel toModel() {
    return _AuthResultModelToEntityMapper().fromFirestore(this);
  }
}
