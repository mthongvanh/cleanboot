import 'package:flutter/material.dart';

import '../../../core/errors/failures.dart';

/// Provides values to display on corresponding widgets
abstract class ViewModel<T> extends ChangeNotifier {
  final Key _debugKey = UniqueKey();

  /// Error notifier
  final ValueNotifier<Failure?> error = ValueNotifier<Failure?>(null);

  /// Whether the page is waiting for an asynchronous process to complete
  final loading = ValueNotifier(false);

  /// Notifies listeners that the view model has changed
  void update() => notifyListeners();
}
