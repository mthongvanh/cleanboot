import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as flutter_dotenv;

import '../cleanboot.dart';
import '../modules/auth/domain/data_sources/auth_remote_data_source.dart';
import 'domain/firebase_options.dart';

export 'data/app_service_locator.dart';
export 'domain/service_locator.dart';

/// Core DI class for initializing service locators.
///
/// Provides a default authentication repo and auth use case that depends on firebase
class DependencyInjection {
  /// Configure the service locator and app dependencies
  static Future<Object?> bootstrap(final List<ServiceLocator> locators, {
    required final AppInitConfig config,
  }) async {
    Object? result;
    try {
      // initialize DotEnv variables
      await flutter_dotenv.dotenv.load();

      // initialize firebase first to catch any exceptions
      if (config.firebaseEnabled) {
        await _initializeFirebase();

        // setup a default auth-flow implementation that depends on firebase
        if (config.firebaseAuthEnabled) {
          await _setupDefaultAuthentication(locators);
        }
      }

      result = Future.forEach(
        locators,
            (final ServiceLocator element) => element.init(),
      );
    } catch (exception, stack) {
      debugPrintStack(
        stackTrace: stack,
      );
    }
    return result;
  }

  static Future<void> _initializeFirebase({
    final FirebaseOptions? options,
  }) async {
    await Firebase.initializeApp(
      options: options ?? DefaultFirebaseOptions.currentPlatform,
    );
  }

  /// Setup default authentication flow that depends on firebase
  ///
  /// This function will skip any classes that have already been registered
  /// with the service locators. E.g. if a AuthRemoteDataSource has already been
  /// registered, it will not get unregistered and replaced with the FirebaseAuthRemoteDataSource
  static Future<void> _setupDefaultAuthentication(
      final List<ServiceLocator> locators,) async {
    // first check to see if a remote data source is registered because the
    // default auth repository depends on it
    if (locators
        .where((final element) => element.isRegistered<AuthRemoteDataSource>())
        .isEmpty) {
      locators.first
          .registerSingleton<AuthRemoteDataSource>(
        FirebaseAuthRemoteDataSource(),
      );
    }

    // register the repository
    if (locators
        .where((final element) => element.isRegistered<AuthRepository>())
        .isEmpty) {
      final sl = locators.first;
      sl.registerSingleton<AuthRepository>(
        AuthRepositoryImpl(sl.get<AuthRemoteDataSource>()),
      );
    }

    // register use-cases which depend on the repository
    if (locators
        .where((final element) => element.isRegistered<GetAuthedUserUseCase>())
        .isEmpty) {
      final sl = locators.first;
      sl.registerSingleton<GetAuthedUserUseCase>(
        GetAuthedUserUseCase(sl.get<AuthRepository>()),
      );
    }

    if (locators
        .where((final element) => element.isRegistered<SignInUseCase>())
        .isEmpty) {
      final sl = locators.first;
      sl.registerSingleton<SignInUseCase>(
        SignInUseCase(sl.get<AuthRepository>()),
      );
    }

    if (locators
        .where((final element) => element.isRegistered<SignOutUseCase>())
        .isEmpty) {
      final sl = locators.first;
      sl.registerSingleton<SignOutUseCase>(
        SignOutUseCase(sl.get<AuthRepository>()),
      );
    }
  }
}
