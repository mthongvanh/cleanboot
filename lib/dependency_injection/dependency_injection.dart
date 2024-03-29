import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as flutter_dotenv;

import '../config/app_config.dart';
import 'domain/firebase_options.dart';
import 'domain/service_locator.dart';

export 'data/app_service_locator.dart';
export 'domain/service_locator.dart';

/// Core DI class for initializing service locators
class DependencyInjection {
  /// Configure the service locator and app dependencies
  static Future<Object?> bootstrap(
    final List<ServiceLocator> locators, {
    required final AppInitConfig config,
  }) async {
    Object? result;
    try {
      // initialize DotEnv variables
      await flutter_dotenv.dotenv.load();

      // initialize firebase first to catch any exceptions
      if (config.firebaseEnabled) {
        await _initializeFirebase();
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
}
