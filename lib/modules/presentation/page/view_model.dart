import 'package:flutter/material.dart';

/// Provides values to display on corresponding widgets
abstract class ViewModel<T> extends ChangeNotifier {
  final Key _debugKey = UniqueKey();

  /// Notifies listeners that the view model has changed
  void update() => notifyListeners();
}