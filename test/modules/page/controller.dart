import 'package:flutter/widgets.dart';
import 'view_model.dart';

/// Controls values in a [ViewModel] that is associated to a [Widget]
abstract class ScreenController<T extends Widget> {
  /// View model associated to a widget
  ViewModel<T> get viewModel => throw UnimplementedError(
    'Screen controllers must provide a view model',
  );

  /// Notifies widgets that values on the view model have been updated
  void notify() => viewModel.update();
}