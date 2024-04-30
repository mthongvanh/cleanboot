import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../../cleanboot.dart';
import '../../data/models/entitlement_model.dart';
import '../../data/models/subscription_status_model.dart';
import '../../domain/entities/subscription_status.dart';
import '../mappers.dart';
import 'entitlement_mapper.dart';

class _SubscriptionStatusModelToEntityMapper
    extends Mapper<SubscriptionStatusModel, SubscriptionStatus> {
  SubscriptionStatusModel fromPurchaserInfo(final CustomerInfo purchaserInfo) {
    return SubscriptionStatusModel(
      isActive: purchaserInfo.entitlements.active.isNotEmpty,
      entitlements: purchaserInfo.entitlements.active.values
          .map((e) => EntitlementModel(
        id: e.identifier,
        isActive: e.isActive,
      ))
          .toList(),
    );
  }

  @override
  SubscriptionStatusModel fromEntity(final SubscriptionStatus entity) => SubscriptionStatusModel(
    isActive: entity.isActive,
    entitlements: entity.entitlements?.map((final e) => e.toModel).toList(),
  );

  @override
  SubscriptionStatus toEntity(final SubscriptionStatusModel model) => SubscriptionStatus(
    isActive: model.isActive,
    entitlements: model.entitlements!.map((final e) => e.toEntity).toList(),
  );
}

/// Maps a [SubscriptionStatusModel] to a [SubscriptionStatus] entity
extension SubscriptionStatusModelExt on SubscriptionStatusModel {
  /// Maps this model to a [SubscriptionStatus] entity
  SubscriptionStatus get toEntity => _SubscriptionStatusModelToEntityMapper().toEntity(this);
}

/// Maps a [SubscriptionStatus] entity to a [SubscriptionStatusModel]
extension SubscriptionStatusEntityExt on SubscriptionStatus {
  /// Maps this entity to a [SubscriptionStatusModel]
  SubscriptionStatusModel get toModel =>
      _SubscriptionStatusModelToEntityMapper().fromEntity(this);
}

/// Maps a [PurchaserInfo] from RevenueCat to a [SubscriptionStatusModel]
extension PurchaserInfoToModelExt on CustomerInfo {
  /// Maps this PurchaserInfo to a [SubscriptionStatusModel]
  SubscriptionStatusModel toModel() {
    return _SubscriptionStatusModelToEntityMapper().fromPurchaserInfo(this);
  }
}
