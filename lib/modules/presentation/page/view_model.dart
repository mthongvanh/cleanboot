import 'package:flutter/material.dart';

/// Provides values to display on corresponding widgets
abstract class ViewModel<T> extends ChangeNotifier {
  /// Notifies listeners that the view model has changed
  void update() => notifyListeners();
}