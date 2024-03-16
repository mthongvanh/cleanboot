import 'package:flutter/widgets.dart';

/// {@template HomePage}
/// Initial page that loads after app setup and/or authentication has completed
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro Widget.PageName}
  static const name = 'LaunchPage';

  /// {@macro HomePage}
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Placeholder(
      child: Text(
        'This is the home page',
      ),
    );
  }
}
