import '../../domain/data_sources/{{identifier.snakeCase()}}_local_data_source.dart';
import '../../domain/data_sources/{{identifier.snakeCase()}}_remote_data_source.dart';
import '../../domain/repositories/{{identifier.snakeCase()}}_repository.dart';

/// {@template {{identifier.pascalCase()}}RepositoryImpl}
/// Extends [{{identifier.pascalCase()}}Repository] base class
///
/// {@macro {{identifier.pascalCase()}}Repository}
/// {@endtemplate}
class {{identifier.pascalCase()}}RepositoryImpl extends {{identifier.pascalCase()}}Repository {

  /// Provides access to local {{identifier}} data sources
  final {{identifier.pascalCase()}}LocalDataSource localDataSource;

  /// Provides access to remote {{identifier}} data sources
  final {{identifier.pascalCase()}}RemoteDataSource remoteDataSource;

  /// {@macro {{identifier.pascalCase()}}RepositoryImpl}
  {{identifier.pascalCase()}}RepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });
}
