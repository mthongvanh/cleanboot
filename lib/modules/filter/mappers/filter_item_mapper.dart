import 'package:cleanboot/cleanboot.dart';

import '../data/models/filter_item_model.dart';
import '../domain/entities/filter_item.dart';

class _FilterItemModelToEntityMapper
    extends Mapper<FilterItemModel, FilterItem> {
  @override
  FilterItemModel fromEntity(final FilterItem entity) => FilterItemModel(
        key: entity.key,
        value: entity.value,
        displayText: entity.displayText,
      );

  @override
  FilterItem toEntity(final FilterItemModel model) => FilterItem(
        key: model.key,
        value: model.value,
        displayText: model.displayText,
      );
}

/// Maps a [FilterItemModel] to a [FilterItem] entity
extension FilterItemModelExt on FilterItemModel {
  /// Maps a [FilterItemModel] to a [FilterItem] entity
  FilterItem get toEntity => _FilterItemModelToEntityMapper().toEntity(this);
}

/// Maps a [FilterItem] entity to a [FilterItemModel]
extension FilterItemExt on FilterItem {
  /// Maps a [FilterItem] entity to a [FilterItemModel]
  FilterItemModel get toModel =>
      _FilterItemModelToEntityMapper().fromEntity(this);
}
