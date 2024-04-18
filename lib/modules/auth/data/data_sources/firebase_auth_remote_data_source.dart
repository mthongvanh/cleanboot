import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../cleanboot.dart' as cleanboot;
import '../../auth.dart' as cleanboot;
import '../../domain/data_sources/auth_remote_data_source.dart';
import '../../mappers/mappers.dart';

/// Perform authentication-related operations with Firebase
class FirebaseAuthRemoteDataSource extends AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  @override
  Future<cleanboot.AuthResultModel> authenticate(
    final cleanboot.AuthParams params,
  ) async {
    try {
      UserCredential? credential;
      if (params.identifier == 'anonymous' && params.secret == null) {
        credential = await _signInAnonymously();
      } else {
        credential = await _signInWithEmailPassword(
          params.identifier ?? '',
          params.secret ?? '',
        );
      }

      if (credential != null) {
        return credential.toModel();
      } else {
        throw Exception('No user credential was found');
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleAuthError(e));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  /// Sign in anonymously
  Future<UserCredential?> _signInAnonymously() async {
    final UserCredential userCredential =
        await _firebaseAuth.signInAnonymously();
    return userCredential;
  }

  /// Sign in with email and password
  Future<UserCredential?> _signInWithEmailPassword(
    final String email,
    final String password,
  ) async {
    final UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  /// SIGN UP METHOD
  @override
  Future<cleanboot.AuthResultModel> signUp({
    required final String identifier,
    required final String password,
    final String? displayName,
  }) async {
    late final UserCredential response;
    response = await _firebaseAuth.createUserWithEmailAndPassword(
      email: identifier,
      password: password,
    );

    final user = _firebaseAuth.currentUser;
    // link the anonymous user with a newly-created firebase user
    if (response.credential != null) {
      await user?.linkWithCredential(response.credential!);
    }

    // only update the display name if one was supplied or it's different from
    // the current display name
    if ((displayName?.isNotEmpty ?? false) &&
        (user?.displayName?.toLowerCase() != displayName!.toLowerCase())) {
      await updateUserDisplayName(displayName);
    }

    return response.toModel();
  }

  /// Sign out a user
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

// Handle Firebase Auth errors
  String _handleAuthError(final FirebaseAuthException e) {
    String errorMessage;
    switch (e.code) {
      case 'invalid-email':
        errorMessage = 'Your email or password is incorrect.';
      case 'wrong-password':
        errorMessage = 'Your email or password is incorrect.';
      case 'user-not-found':
        errorMessage = 'Your email or password is incorrect.';
      case 'user-disabled':
        errorMessage = 'Oops... Something went wrong.(1)';
      case 'too-many-requests':
        errorMessage = 'Oops... Something went wrong.(2)';
      case 'operation-not-allowed':
        errorMessage = 'Login method is not enabled.';
      default:
        errorMessage = 'Oops... Something went wrong.(3)';
    }
    return errorMessage;
  }

  @override
  FutureOr<cleanboot.AuthedUserModel?> currentUser() =>
      _firebaseAuth.currentUser?.toModel;

  @override
  Stream<cleanboot.AuthedUserModel?> streamCurrentUser() {
    try {
      return _firebaseAuth
          .userChanges()
          .map<cleanboot.AuthedUserModel?>((final User? event) {
        if (event != null) {
          return event.toModel;
        } else {
          return null;
        }
      }).asBroadcastStream();
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleAuthError(e));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  FutureOr<cleanboot.AuthedUserModel?> updateUserDisplayName(
    final String updatedName,
  ) async {
    try {
      final names = await _firestore.collection('displayNames').get();
      bool unique = true;
      for (final QueryDocumentSnapshot snapshot in names.docs) {
        final displayName =
            (snapshot.data()! as Map<String, dynamic>)['displayName'];
        if ((snapshot.data()! as Map<String, dynamic>)['displayName'] != null) {
          unique = displayName?.toString().toLowerCase() !=
              updatedName.toLowerCase();
          if (!unique) {
            break;
          }
        }
      }

      if (!unique) {
        throw Exception('Display name already exists');
      }

      final user = _firebaseAuth.currentUser;
      await user?.updateDisplayName(updatedName);
      await _firestore.collection('displayNames').add({
        'userUid': user?.uid,
        'displayName': updatedName,
        'createdOn': FieldValue.serverTimestamp(),
      });
      return currentUser();
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleAuthError(e));
    } catch (e) {
      debugPrint(
        'error updating the firebase record for current user\n$e',
      );
      rethrow;
    }
  }

  @override
  Future<List<String>> getDisplayNames(
    final cleanboot.GetDisplayNamesParams params,
  ) async {
    try {
      final source = Source.values.firstWhere(
        (final element) =>
            element.name.toLowerCase() == params.cacheType?.toLowerCase(),
        orElse: () => Source.serverAndCache,
      );

      final options = GetOptions(
        source: source,
      );

      final snapshot = await _firestore.collection('displayNames').get(options);
      final names = snapshot.docs.map((final e) {
        return e.get('displayName') as String;
      }).toList();
      return names;
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleAuthError(e));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> displayNameExists(
      final cleanboot.DisplayNameExistsParams params) async {
    final source = Source.values.firstWhere(
      (final element) =>
          element.name.toLowerCase() == params.cacheType?.toLowerCase(),
      orElse: () => Source.serverAndCache,
    );

    final options = GetOptions(
      source: source,
    );

    final names = await _firestore.collection('displayNames').get(options);
    bool unique = true;
    for (final QueryDocumentSnapshot snapshot in names.docs) {
      final displayName =
          (snapshot.data()! as Map<String, dynamic>)['displayName'];
      if (displayName != null) {
        unique = displayName?.toString().toLowerCase() !=
            params.displayName.toLowerCase();
        if (!unique) {
          break;
        }
      }
    }

    return unique;
  }

  @override
  Future<void> deleteUser() async {
    try {
      await _firebaseAuth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
