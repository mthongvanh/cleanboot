import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '{{identifier.snakeCase()}}_controller.dart';
import '{{identifier.snakeCase()}}_view_model.dart';

/// {@template {{identifier.pascalCase()}}}
/// {@endtemplate}
class {{identifier.pascalCase()}}Page extends StatelessWidget {
  /// {@macro Widget.PageName}
  static const name = '{{identifier.pascalCase()}}Page';

  /// {@macro Widget.PagePath}
  static const path = '{{identifier.paramCase()}}Page';

  /// {@macro Widget.ViewModel}
  final {{identifier.pascalCase()}}PageViewModel viewModel;

  /// {@macro Widget.Controller}
  final {{identifier.pascalCase()}}PageController controller;

  /// {@macro {{identifier.pascalCase()}}}
  const {{identifier.pascalCase()}}Page({
    required this.viewModel,
    required this.controller,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (final context, final _) {
        return DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: MediaQuery.sizeOf(context).aspectRatio > 1 ? BoxFit.fitWidth : BoxFit.fitHeight,
              image: const AssetImage('assets/images/splash/splash_bg.jpeg'),
              opacity: 0.5,
            ),
          ),
          child: Center(
            child: TextButton(
              onPressed: null,
              child: Lottie.asset(
                'assets/animations/paint_animation.json',
                reverse: true,
              ),
            ),
          ),
        );
      },
      child: ColoredBox(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
