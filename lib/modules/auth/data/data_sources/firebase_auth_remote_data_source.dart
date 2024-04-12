import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../auth.dart';
import '../../domain/data_sources/auth_remote_data_source.dart';
import '../../mappers/mappers.dart';

/// Perform authentication-related operations with Firebase
class FirebaseAuthRemoteDataSource extends AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthResultModel> authenticate(final AuthParams params) async {
    try {
      AuthCredential? credential;
      if (params.identifier == 'anonymous' && params.secret == null) {
        credential = await _signInAnonymously();
      } else {
        credential = await _signInWithEmailPassword(
          params.identifier ?? '',
          params.secret ?? '',
        );
      }
      return credential!.toModel();
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleAuthError(e));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  /// Sign in anonymously
  Future<AuthCredential?> _signInAnonymously() async {
    final UserCredential userCredential =
        await _firebaseAuth.signInAnonymously();
    return userCredential.credential;
  }

  /// Sign in with email and password
  Future<AuthCredential?> _signInWithEmailPassword(
    final String email,
    final String password,
  ) async {
    final UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.credential;
  }

  /// SIGN UP METHOD
  @override
  Future<AuthResultModel> signUp({
    required final String identifier,
    required final String password,
  }) async {
    final response = await _firebaseAuth.createUserWithEmailAndPassword(
      email: identifier,
      password: password,
    );

    // link the anonymous user with a newly-created firebase user
    if (response.credential != null) {
      await _firebaseAuth.currentUser?.linkWithCredential(response.credential!);
    }

    return response.credential!.toModel();
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
        errorMessage = "Your email or password is incorrect.";
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
  FutureOr<AuthedUserModel?> currentUser() =>
      _firebaseAuth.currentUser?.toModel;

  @override
  FutureOr<AuthedUserModel?> updateUserDisplayName(
    final String updatedName,
  ) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(updatedName);
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
}
