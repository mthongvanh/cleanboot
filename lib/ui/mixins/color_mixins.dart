import 'package:flutter/material.dart';

/// Default specifiers for app components' themes
mixin WidgetDefaults on Object {
  /// Custom [NavigationBar] appearance overrides
  NavigationBarThemeData navigationBar(final ColorScheme colorScheme) =>
      NavigationBarThemeData(
        surfaceTintColor: Colors.transparent,
        overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
        // backgroundColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (final states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(
                color: colorScheme.error,
                fontSize: 8,
              );
            } else {
              return const TextStyle(
                color: Colors.transparent,
                fontSize: 8,
              );
            }
          },
        ),
        iconTheme:
            MaterialStateProperty.resolveWith<IconThemeData>((final states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: colorScheme.onSecondaryContainer);
          } else {
            return IconThemeData(color: colorScheme.outline);
          }
        }),
      );
}
