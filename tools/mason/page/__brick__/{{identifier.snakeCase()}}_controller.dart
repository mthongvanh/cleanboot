import 'dart:async';

import 'package:cleanboot/cleanboot.dart';

import '{{identifier.snakeCase()}}_page.dart';
import '{{identifier.snakeCase()}}_view_model.dart';

/// Controls values on a view model to update widgets
class {{identifier.pascalCase()}}PageController extends Controller<{{identifier.pascalCase()}}Page> {
  /// Holds values for [{{identifier.pascalCase()}}Page] widgets
  final {{identifier.pascalCase()}}PageViewModel _viewModel;

  /// Creates a new instance of [{{identifier.pascalCase()}}PageController]
  {{identifier.pascalCase()}}PageController(
    this._viewModel,
    super.navigator,
  );

  /// Perform some initialization steps
  FutureOr<void> init() async {
    return;
  }

  @override
  {{identifier.pascalCase()}}PageViewModel get viewModel => _viewModel;
}
