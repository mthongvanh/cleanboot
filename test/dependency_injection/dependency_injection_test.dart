// ignore_for_file: unreachable_from_main

import 'package:cleanboot/dependency_injection/domain/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

class MockServiceLocator extends ServiceLocator {
  GetIt get _locator => GetIt.instance;

  @override
  T get<T extends Object>({final String? identifier}) =>
      _locator.get<T>(instanceName: identifier);

  @override
  void registerFactory<T extends Object>(
    final T Function() creator, {
    final String? identifier,
  }) {
    _locator.registerFactory<T>(creator, instanceName: identifier);
  }

  @override
  void registerSingleton<T extends Object>(
    final T instance, {
    final String? identifier,
  }) {
    _locator.registerSingleton<T>(instance, instanceName: identifier);
  }
}

class MockService {
  /// Service identifier
  final String name;
  MockService(this.name);
}

void main() {
  final serviceLocator = MockServiceLocator();
  group('Testing the Service Locator', () {
    tearDown(() async => serviceLocator._locator.reset());
    test('Register a factory and retrieve it', () {
      // Arrange
      MockService mockFactory() => MockService('Mock Service');
      serviceLocator.registerFactory<MockService>(
        mockFactory,
        // identifier: 'testIdentifier',
      );

      // Act
      final instance1 = serviceLocator.get<MockService>();
      final instance2 = serviceLocator.get<MockService>();

      // Assert
      expect(instance1, isInstanceOf<MockService>());
      expect(instance2, isInstanceOf<MockService>());
      // expect(identical(instance1, instance2), true);
    });

    test('Register a singleton and retrieve it', () {
      // Arrange
      final mockSingleton = MockService('Mock Singleton');
      serviceLocator.registerSingleton<MockService>(
        mockSingleton,
        identifier: 'testIdentifier2',
      );

      // Act
      final instance1 =
          serviceLocator.get<MockService>(identifier: 'testIdentifier2');
      final instance2 =
          serviceLocator.get<MockService>(identifier: 'testIdentifier2');

      // Assert
      expect(instance1, isInstanceOf<MockService>());
      expect(instance2, isInstanceOf<MockService>());
      expect(identical(instance1, instance2), true);
    });

    test('Retrieve a non-existent service', () {
      // Act & Assert
      expect(
        () => serviceLocator.get<MockService>(),
        throwsStateError,
      );
    });
  });
}
