import 'package:get_it/get_it.dart';

import '../dependency_injection.dart';
import '../domain/service_locator.dart';

/// {@template AppServiceLocator}
/// Registers dependencies with a service locator
/// {@endtemplate}
abstract class AppServiceLocator extends ServiceLocator {
  /// Service locator that provides dependencies to the application
  final GetIt _getIt = GetIt.asNewInstance();

  /// {@macro AppServiceLocator}
  AppServiceLocator();

  /// setup application dependencies in the service locator
  @override
  Future<void> init() async {
    ///TODO: add app dependencies here
  }

  @override
  T get<T extends Object>({
    final String? identifier,
    final Object? param1,
    final Object? param2,
  }) {
    return _getIt.get<T>(
      instanceName: identifier,
      param1: param1,
      param2: param2,
    );
  }

  @override
  void registerFactory<T extends Object>(
    final T Function() creator, {
    final String? identifier,
  }) {
    _getIt.registerFactory<T>(
      creator,
      instanceName: identifier,
    );
  }

  @override
  void registerFactoryParams<T extends Object, Param1, Param2>(
    final T Function(Param1 param1, Param2 param2) factoryBuilder, {
    final String? identifier,
  }) {
    _getIt.registerFactoryParam<T, Param1, Param2>(
      factoryBuilder,
      instanceName: identifier,
    );
  }

  @override
  void registerSingleton<T extends Object>(
    final T instance, {
    final String? identifier,
  }) {
    _getIt.registerSingleton<T>(
      instance,
      instanceName: identifier,
    );
  }

  @override
  void registerLazySingleton<T extends Object>(
    final T Function() creator, {
    final String? identifier,
  }) {
    _getIt.registerLazySingleton<T>(
      creator,
      instanceName: identifier,
    );
  }
}
