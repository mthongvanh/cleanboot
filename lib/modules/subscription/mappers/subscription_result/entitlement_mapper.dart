import 'package:cleanboot/cleanboot.dart';

import '../../data/models/entitlement_model.dart';
import '../../domain/entities/entitlement.dart';


class _EntitlementModelToEntityMapper
    extends Mapper<EntitlementModel, Entitlement> {
  @override
EntitlementModel fromEntity(final Entitlement entity) => EntitlementModel(
    id: entity.id,
    isActive: entity.isActive,
  );

  @override
Entitlement toEntity(final EntitlementModel model) => Entitlement(
    id: model.id,
    isActive: model.isActive,
  );
}

/// Maps a [EntitlementModel] to a [Entitlement] entity
extension EntitlementModelExt on EntitlementModel {
  /// Maps a [EntitlementModel] to a [Entitlement] entity
Entitlement get toEntity => _EntitlementModelToEntityMapper().toEntity(this);
}

/// Maps a [Entitlement] entity to a [EntitlementModel]
extension EntitlementExt on Entitlement {
  /// Maps a [Entitlement] entity to a [EntitlementModel]
  EntitlementModel get toModel =>
      _EntitlementModelToEntityMapper().fromEntity(this);
}
