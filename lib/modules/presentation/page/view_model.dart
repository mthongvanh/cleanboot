import 'package:flutter/material.dart';

import '../../../core/errors/failures.dart';

/// Provides values to display on corresponding widgets
abstract class ViewModel<T> extends ChangeNotifier {
  final Key _debugKey = UniqueKey();

  /// Error notifier
  final ValueNotifier<Failure?> error = ValueNotifier<Failure?>(null);

  /// Notifies listeners that the view model has changed
  void update() => notifyListeners();
}
