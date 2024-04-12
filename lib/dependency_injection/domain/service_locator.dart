/// {@template ServiceLocator}
/// Provides service-class objects to the application
/// {@endtemplate}
abstract class ServiceLocator {
  /// initialize a service locator
  Future<Object?> init();

  /// Returns a registered service from the locator
  T get<T extends Object>({final String? identifier});

  /// Query whether a service has been registered
  bool isRegistered<T extends Object>({final String? identifier});

  /// Registers a factory in the service locator
  void registerFactory<T extends Object>(
    final T Function() creator, {
    final String? identifier,
  });

  /// Registers a factory in the service locator that initializes an instance
  /// with up to two parameters
  void registerFactoryParams<T extends Object, Param1, Param2>(
    final T Function(Param1 param1, Param2 param2) factoryBuilder, {
    final String? identifier,
  });

  /// Registers a singleton in the service locator
  void registerSingleton<T extends Object>(
    final T instance, {
    final String? identifier,
  });

  /// Registers a singleton in the service locator that instantiates on the
  /// first invocation
  void registerLazySingleton<T extends Object>(
    final T Function() creator, {
    final String? identifier,
  });

  /// Unregister a singleton from the service locator
  Future<void> unregister<T extends Object>({
    final T instance,
    final String? identifier,
  });
}
