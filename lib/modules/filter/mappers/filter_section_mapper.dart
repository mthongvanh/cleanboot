import 'package:cleanboot/cleanboot.dart';

import '../data/models/filter_section_model.dart';
import '../domain/entities/filter_section.dart';
import 'filter_item_mapper.dart';

class _FilterSectionModelToEntityMapper
    extends Mapper<FilterSectionModel, FilterSection> {
  @override
  FilterSectionModel fromEntity(final FilterSection entity) =>
      FilterSectionModel(
        identifier: entity.identifier,
        filterItems: entity.filterItems.map((final e) => e.toModel).toList(),
        displayText: entity.displayText,
        multiSelect: entity.multiSelect,
      );

  @override
  FilterSection toEntity(final FilterSectionModel model) => FilterSection(
        identifier: model.identifier,
        filterItems: model.filterItems.map((final e) => e.toEntity).toList(),
        displayText: model.displayText,
        multiSelect: model.multiSelect,
      );
}

/// Maps a [FilterSectionModel] to a [FilterSection] entity
extension FilterSectionModelExt on FilterSectionModel {
  /// Maps a [FilterSectionModel] to a [FilterSection] entity
  FilterSection get toEntity =>
      _FilterSectionModelToEntityMapper().toEntity(this);
}

/// Maps a [FilterSection] entity to a [FilterSectionModel]
extension FilterSectionExt on FilterSection {
  /// Maps a [FilterSection] entity to a [FilterSectionModel]
  FilterSectionModel get toModel =>
      _FilterSectionModelToEntityMapper().fromEntity(this);
}
