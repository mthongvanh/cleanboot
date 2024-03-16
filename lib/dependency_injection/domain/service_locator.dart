/// {@template ServiceLocator}
/// Provides service-class objects to the application
/// {@endtemplate}
abstract class ServiceLocator {
  /// Returns a registered service from the locator
  T get<T extends Object>({final String? identifier});

  /// Registers a factory in the service locator
  void registerFactory<T extends Object>(
    final T Function() creator, {
    final String? identifier,
  });

  /// Registers a singleton in the service locator
  void registerSingleton<T extends Object>(
    final T instance, {
    final String? identifier,
  });
}
