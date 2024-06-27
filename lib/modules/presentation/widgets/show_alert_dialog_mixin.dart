import 'dart:async';

import 'package:flutter/material.dart';

import '../../../cleanboot.dart';

/// Shows default dialogs
mixin ShowAlertDialog<SW extends StatefulWidget> on State<SW> {
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
          title: titleBuilder != null
              ? titleBuilder.call(context)
              : Text(title ?? 'Info'),
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

  /// Show an alert with a large green check icon
  void showSuccessAlert({
    required final BuildContext context,
    final String? message,
    final String? actionText,
    final VoidCallback? action,
  }) {
    unawaited(
      showDialog<void>(
        context: context,
        builder: (final context) {
          return AlertDialog(
            icon: CircleAvatar(
              minRadius: 40,
              child: Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.onSurface,
                size: 50,
              ),
            ),
            content: Text(
              message ?? 'OK!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  action?.call();
                },
                child: Text(
                  actionText ?? 'Continue',
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
