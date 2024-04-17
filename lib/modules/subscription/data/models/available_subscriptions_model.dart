import 'package:purchases_flutter/purchases_flutter.dart';

class AvailableSubscriptionsModel {
  final List<Package> availablePackages;

  AvailableSubscriptionsModel({required this.availablePackages});

  static AvailableSubscriptionsModel fromOfferings(Offerings offerings) {
    return AvailableSubscriptionsModel(
      availablePackages: offerings.current?.availablePackages ?? [],
    );
  }
}
