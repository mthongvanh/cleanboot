import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../auth.dart';
import '../../domain/data_sources/auth_remote_data_source.dart';
import '../../mappers/user/authed_user_mapper.dart';

/// Perform authentication-related operations with Firebase
class FirebaseAuthRemoteDataSource extends AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthResultModel> authenticate(final AuthParams params) async {
    try {
      AuthCredential? credential;
      if ((params.identifier?.isNotEmpty ?? false) &&
          (params.secret?.isNotEmpty ?? false)) {
        credential =
            await _signInWithEmailPassword(params.identifier!, params.secret!);
      } else {
        credential = await _signInAnonymously();
      }
      return AuthResultModel(
        token: credential?.token.toString() ?? credential?.accessToken,
      );
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

    return AuthResultModel(
      token: response.credential?.token.toString() ??
          response.credential?.accessToken,
    );
  }

  /// Sign out a user
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

// Handle Firebase Auth errors
  String _handleAuthError(final FirebaseAuthException e) {
    String errorMessage;
    switch (e.code) {
      case 'invalid-email':
        errorMessage = 'Your email address appears to be malformed.';
      case 'wrong-password':
        errorMessage = 'Your password is wrong.';
      case 'user-not-found':
        errorMessage = "User with this email doesn't exist.";
      case 'user-disabled':
        errorMessage = 'User with this email has been disabled.';
      case 'too-many-requests':
        errorMessage = 'Too many requests. Try again later.';
      case 'operation-not-allowed':
        errorMessage = 'Signing in with Email and Password is not enabled.';
      default:
        errorMessage = 'An undefined Error happened.';
    }
    return errorMessage;
  }
}
