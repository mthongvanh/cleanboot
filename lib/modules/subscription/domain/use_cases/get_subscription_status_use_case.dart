import 'dart:async';
import 'package:cleanboot/cleanboot.dart';
import 'package:flutter/material.dart';


/// {@template GetSubscriptionStatusUseCase}
/// {@endtemplate}
class GetSubscriptionStatusUseCase
    extends UseCase<SubscriptionStatus, SubscriptionParams> {
  final SubscriptionRepository _subscriptionRepository;

  /// {@macro GetSubscriptionStatusUseCase}
  GetSubscriptionStatusUseCase(this._subscriptionRepository);

  @override
  Future<({Failure? failure, SubscriptionStatus? result})> execute(
      final SubscriptionParams params,) async {
    Failure? failure;
    SubscriptionStatus? result;
    try {
      final response = await _subscriptionRepository.getSubscriptionStatus(params);
      result = response;
    } catch (e) {
      debugPrint(e.toString());
      failure = Failure(
        description: e.toString(),
      );
    }
    return (failure: failure, result: result);
  }
}