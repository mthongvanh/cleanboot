import '../../../cleanboot.dart';

/// Setup DisplayNames dependencies and register them with the service locator
class DisplayNamesInjector {
  /// Setup DisplayNames dependencies and register them with the service locator
  static Future<void> configureDependencies(final ServiceLocator sl) async {
    // if no kv store is registered for display names, setup hive as the default
    if (!sl.isRegistered<KeyValueStore>(
      identifier: AppInitConfig.displayNameStore,
    )) {
      final store = HiveKeyValueStore(AppInitConfig.displayNameStore);
      await store.init();
      sl.registerSingleton<KeyValueStore>(
        store,
        identifier: AppInitConfig.displayNameStore,
      );
    }

    if (!sl.isRegistered<DisplayNamesLocalDataSource>()) {
      sl.registerFactory<DisplayNamesLocalDataSource>(
        () => DisplayNamesLocalDataSourceImpl(
          sl.get<KeyValueStore>(
            identifier: AppInitConfig.displayNameStore,
          ),
        ),
      );
    }

    if (!sl.isRegistered<DisplayNamesRemoteDataSource>()) {
      sl.registerFactory<DisplayNamesRemoteDataSource>(
        DisplayNamesRemoteDataSourceImpl.new,
      );
    }

    if (!sl.isRegistered<DisplayNamesRepository>()) {
      final repo = DisplayNamesRepositoryImpl(
        localDataSource: sl.get<DisplayNamesLocalDataSource>(),
        remoteDataSource: sl.get<DisplayNamesRemoteDataSource>(),
      );

      sl.registerSingleton<DisplayNamesRepository>(repo);
    }
  }
}
