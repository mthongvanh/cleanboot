import 'package:cleanboot/cleanboot.dart';

import '../../{{identifier.snakeCase()}}.dart';

/// Setup {{identifier.pascalCase()}} dependencies and register them with the service locator
class {{identifier.pascalCase()}}Injector {

  /// Setup {{identifier.pascalCase()}} dependencies and register them with the service locator
  static Future<void> configureDependencies(final ServiceLocator sl) async {
    sl.registerFactory<{{identifier.pascalCase()}}LocalDataSource>({{identifier.pascalCase()}}LocalDataSourceImpl.new);
    sl.registerFactory<{{identifier.pascalCase()}}RemoteDataSource>({{identifier.pascalCase()}}RemoteDataSourceImpl.new);

    final repo = {{identifier.pascalCase()}}RepositoryImpl(
      localDataSource: sl.get<{{identifier.pascalCase()}}LocalDataSource>(),
      remoteDataSource: sl.get<{{identifier.pascalCase()}}RemoteDataSource>(),
    );

    sl
      ..registerSingleton<{{identifier.pascalCase()}}Repository>(repo)
      ..registerSingleton<Get{{identifier.pascalCase()}}UseCase>(
        Get{{identifier.pascalCase()}}UseCase(
          repo,
        ),
      );
  }
}
