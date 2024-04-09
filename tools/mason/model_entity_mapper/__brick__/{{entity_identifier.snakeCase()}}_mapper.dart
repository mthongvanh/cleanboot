import 'package:cleanboot/cleanboot.dart';

import '../data/models/{{model_identifier.snakeCase()}}.dart';
import '../domain/entities/{{entity_identifier.snakeCase()}}.dart';

class _{{model_identifier.pascalCase()}}ToEntityMapper
    extends Mapper<{{model_identifier.pascalCase()}}, {{entity_identifier.pascalCase()}}> {
  @override
{{model_identifier.pascalCase()}} fromEntity(final {{entity_identifier.pascalCase()}} entity) => {{model_identifier.pascalCase()}}(
    fieldName: entity.fieldName,
  );

  @override
{{entity_identifier.pascalCase()}} toEntity(final {{model_identifier.pascalCase()}} model) => {{entity_identifier.pascalCase()}}(
    fieldName: model.fieldName,
  );
}

/// Maps a [{{model_identifier.pascalCase()}}] to a [{{entity_identifier.pascalCase()}}] entity
extension {{model_identifier.pascalCase()}}Ext on {{model_identifier.pascalCase()}} {
  /// Maps a [{{model_identifier.pascalCase()}}] to a [{{entity_identifier.pascalCase()}}] entity
{{entity_identifier.pascalCase()}} get toEntity => _{{model_identifier.pascalCase()}}ToEntityMapper().toEntity(this);
}

/// Maps a [{{entity_identifier.pascalCase()}}] entity to a [{{model_identifier.pascalCase()}}]
extension {{entity_identifier.pascalCase()}}Ext on {{entity_identifier.pascalCase()}} {
  /// Maps a [{{entity_identifier.pascalCase()}}] entity to a [{{model_identifier.pascalCase()}}]
  {{model_identifier.pascalCase()}} get toModel =>
      _{{model_identifier.pascalCase()}}ToEntityMapper().fromEntity(this);
}
