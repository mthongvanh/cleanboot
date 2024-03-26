import 'package:flutter/widgets.dart';
import '../../../routing/app_router.dart';
import 'view_model.dart';

/// Controls values in a [ViewModel] that is associated to a [Widget]
abstract class Controller<T extends Widget> {
  /// View model associated to a widget
  ViewModel<T> get viewModel => throw UnimplementedError(
        'Controllers must provide a view model',
      );

  /// [AppRouter] that performs navigation and provides information about the
  /// navigation stack
  AppRouter get appRouter => throw UnimplementedError(
        'Controllers must provide an app router for navigation',
      );

  /// Notifies widgets that values on the view model have been updated
  void notify() => viewModel.update();
}
