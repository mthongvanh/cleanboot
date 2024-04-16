import 'dart:async';

import 'package:cleanboot/cleanboot.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '{{identifier.snakeCase()}}_controller.dart';
import '{{identifier.snakeCase()}}_view_model.dart';

/// {@template {{identifier.pascalCase()}}}
/// {@endtemplate}
class {{identifier.pascalCase()}}Page extends StatefulWidget {
  /// {@macro Widget.PageName}
  static const name = '{{identifier.pascalCase()}}Page';

  /// {@macro Widget.PagePath}
  static const path = '{{identifier.paramCase()}}';

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
  State<{{identifier.pascalCase()}}Page> createState() => _{{identifier.pascalCase()}}PageState();
}

class _{{identifier.pascalCase()}}PageState extends State<{{identifier.pascalCase()}}Page> with ShowErrorDialog<{{identifier.pascalCase()}}Page> {

  @override
  void initState() {
    unawaited(widget.controller.init());

    widget.viewModel.error.addListener(() async {
      final failure = widget.viewModel.error.value;
      if (failure != null) {
      unawaited(
        showErrorDialog(
          context,
          failure: widget.viewModel.error.value,
        ),
      );
      widget.viewModel.error.value = null;
    }
  });

    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
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
