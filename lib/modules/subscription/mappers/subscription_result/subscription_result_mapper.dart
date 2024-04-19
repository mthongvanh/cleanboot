import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../../cleanboot.dart';
import '../../data/models/subscription_result_model.dart';
import '../../domain/entities/subscription_result.dart';
import '../mappers.dart';

class _SubscriptionResultModelToEntityMapper
    extends Mapper<SubscriptionResultModel, SubscriptionResult> {
  SubscriptionResultModel fromPurchaserInfo(final CustomerInfo purchaserInfo) {
    return SubscriptionResultModel(
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
  SubscriptionResultModel fromEntity(final SubscriptionResult entity) => SubscriptionResultModel(
    isActive: entity.isActive,
    entitlements: entity.entitlements,
  );

  @override
  SubscriptionResult toEntity(final SubscriptionResultModel model) => SubscriptionResult(
    isActive: model.isActive,
    entitlements: model.entitlements?.map((e) => e.toEntity()).toList(),
  );
}

/// Maps a [SubscriptionResultModel] to a [SubscriptionResult] entity
extension SubscriptionResultModelExt on SubscriptionResultModel {
  /// Maps this model to a [SubscriptionResult] entity
  SubscriptionResult get toEntity => _SubscriptionResultModelToEntityMapper().toEntity(this);
}

/// Maps a [SubscriptionResult] entity to a [SubscriptionResultModel]
extension SubscriptionResultEntityExt on SubscriptionResult {
  /// Maps this entity to a [SubscriptionResultModel]
  SubscriptionResultModel get toModel =>
      _SubscriptionResultModelToEntityMapper().fromEntity(this);
}

/// Maps a [PurchaserInfo] from RevenueCat to a [SubscriptionResultModel]
extension PurchaserInfoToModelExt on CustomerInfo {
  /// Maps this PurchaserInfo to a [SubscriptionResultModel]
  SubscriptionResultModel toModel() {
    return _SubscriptionResultModelToEntityMapper().fromPurchaserInfo(this);
  }
}
