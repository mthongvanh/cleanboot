import 'package:flutter/material.dart';

import '../../../cleanboot.dart';

/// Shows a default error dialog
mixin ShowErrorDialog<SW extends StatefulWidget> on State<SW> {
  /// displays an error dialog
  Future<T?> showAuthErrorDialog<T>(
    final BuildContext context, {
    final Failure? failure,
    final String? title,
    final WidgetBuilder? titleBuilder,
    final String? primaryText,
    final String? secondaryText,
  }) async {
    final result = await showDialog<T>(
      context: context,
      builder: (final BuildContext context) {
        return AlertDialog(
          title: title != null ? Text(title) : titleBuilder?.call(context),
          content: Text(
            failure?.description ?? 'An error occurred',
            // textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(primaryText ?? 'Dismiss'),
              onPressed: () {
                Navigator.of(context).pop({
                  'errorDialogButton': 'primary',
                });
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(secondaryText ?? 'Sign-In'),
              onPressed: () {
                Navigator.of(context).pop({
                  'errorDialogButton': 'secondary',
                });
              },
            ),
          ],
        );
      },
    );
    return result;
  }

  /// Show general alert dialog
  Future<T?> showErrorDialog<T>(
    final BuildContext context, {
    final Failure? failure,
    final String? title,
    final WidgetBuilder? titleBuilder,
    final String? primaryText,
  }) async {
    final result = await showDialog<T>(
      context: context,
      builder: (final BuildContext context) {
        return AlertDialog(
          title: title != null
              ? Text(title)
              : titleBuilder?.call(context),
          content: Text(
            failure?.description ?? 'An error occurred',
            // textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(primaryText ?? 'Dismiss'),
              onPressed: () {
                Navigator.of(context).pop({
                  'errorDialogButton': 'primary',
                });
              },
            ),
          ],
        );
      },
    );
    return result;
  }
}
