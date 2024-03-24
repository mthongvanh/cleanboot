import 'package:flutter/cupertino.dart';

import 'domain/service_locator.dart';

export 'data/app_service_locator.dart';
export 'domain/service_locator.dart';

/// Core DI class for initializing service locators
class DependencyInjection {
  /// Configure the service locator and app dependencies
  static Future<Object?> bootstrap([
    final List<ServiceLocator> locators = const <ServiceLocator>[],
  ]) async {
    Object? result;
    try {
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
}
