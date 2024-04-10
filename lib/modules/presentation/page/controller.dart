import 'dart:async';

import 'package:flutter/widgets.dart';
import '../../../routing/app_router.dart';
import 'view_model.dart';

/// Controls values in a [ViewModel] that is associated to a [Widget]
abstract class Controller<T extends Widget> {
  final _debugKey = UniqueKey();

  /// View model associated to a widget
  ViewModel<T> get viewModel => throw UnimplementedError(
        'Controllers must provide a view model',
      );

  /// [AppRouter] that performs navigation and provides information about the
  /// navigation stack
  final AppRouter navigator;

  /// Controls values in a [ViewModel] that is associated to a [Widget]
  Controller(this.navigator);

  /// Initialize any controller state
  Future<void> init() async {
    return;
  }

  /// Notifies widgets that values on the view model have been updated
  void notify() => viewModel.update();
}
