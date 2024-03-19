import 'package:flutter/widgets.dart';
import 'view_model.dart';

/// Controls values in a [ViewModel] that is associated to a [Widget]
abstract class Controller<T extends Widget> {
  /// View model associated to a widget
  ViewModel<T> get viewModel => throw UnimplementedError(
    'Controllers must provide a view model',
  );

  /// Notifies widgets that values on the view model have been updated
  void notify() => viewModel.update();
}