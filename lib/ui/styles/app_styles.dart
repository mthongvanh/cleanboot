// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

@immutable
abstract class AppStyle {
  AppStyle({final Size? screenSize}) {
    updateScale(screenSize);
  }

  /// Scale applied to screen-size-dependent values
  double scale = 1;

  /// Rounded edge corner radii
  late final _Corners corners = _Corners();

  late final _Shadows shadows = _Shadows();

  /// Padding and margin values
  _Insets get insets => _Insets(scale);

  /// Shared sizes
  late final _Sizes sizes = _Sizes();

  /// Updates the scale applied to screen-size dependent values like Inset
  void updateScale(final Size? screenSize) {
    if (screenSize == null) {
      scale = 1;
      return;
    }
    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000;
    const tabletLg = 800;
    if (shortestSide > tabletXl) {
      scale = 1.2;
    } else if (shortestSide > tabletLg) {
      scale = 1.1;
    } else {
      scale = 1;
    }
  }
}

@immutable
class _Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 32;
}

// TODO: add, @immutable when design is solidified
class _Sizes {
  double get maxContentWidth1 => 800;
  double get maxContentWidth2 => 600;
  double get maxContentWidth3 => 500;
  final Size minAppSize = const Size(380, 650);
}

@immutable
class _Insets {
  _Insets(this._scale);
  final double _scale;

  late final double xxs = 4 * _scale;
  late final double xs = 8 * _scale;
  late final double sm = 16 * _scale;
  late final double md = 24 * _scale;
  late final double lg = 32 * _scale;
  late final double xl = 48 * _scale;
  late final double xxl = 56 * _scale;
  late final double offset = 80 * _scale;
}

@immutable
class _Shadows {
  final textSoft = [
    Shadow(color: Colors.black.withOpacity(.25), offset: Offset(0, 2), blurRadius: 4),
  ];
  final text = [
    Shadow(color: Colors.black.withOpacity(.6), offset: Offset(0, 2), blurRadius: 2),
  ];
  final textStrong = [
    Shadow(color: Colors.black.withOpacity(.6), offset: Offset(0, 4), blurRadius: 6),
  ];

  /// Default shadow for [PaintzCard] items
  final cardOffset = [
    BoxShadow(
      color: Colors.black.withOpacity(0.75),
      offset: const Offset(-10, 35),
      blurRadius: 30.0,
      spreadRadius: -35.0,
      blurStyle: BlurStyle.outer,
    ),
  ];
}
