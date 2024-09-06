import '../../../cleanboot.dart';

class _DisplayNameModelToEntityMapper
    extends Mapper<DisplayNameModel, DisplayName> {
  @override
  DisplayNameModel fromEntity(final DisplayName entity) => DisplayNameModel(
        identifier: entity.identifier,
        createdOn: entity.createdOn,
        displayName: entity.displayName,
        userUid: entity.userUid,
      );

  @override
  DisplayName toEntity(final DisplayNameModel model) => DisplayName(
        identifier: model.identifier,
        createdOn: model.createdOn,
        displayName: model.displayName,
        userUid: model.userUid,
      );
}

/// Maps a [DisplayNameModel] to a [DisplayName] entity
extension DisplayNameModelExt on DisplayNameModel {
  /// Maps a [DisplayNameModel] to a [DisplayName] entity
  DisplayName get toEntity => _DisplayNameModelToEntityMapper().toEntity(this);
}

/// Maps a [DisplayName] entity to a [DisplayNameModel]
extension DisplayNameExt on DisplayName {
  /// Maps a [DisplayName] entity to a [DisplayNameModel]
  DisplayNameModel get toModel =>
      _DisplayNameModelToEntityMapper().fromEntity(this);
}
