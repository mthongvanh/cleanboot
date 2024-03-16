import 'package:flutter/widgets.dart';

/// {@template LaunchPage}
/// Entry point for the application
/// {@endtemplate}
class LaunchPage extends StatelessWidget {
  /// {@template Widget.PageName}
  /// Page widget identifier
  /// {@endtemplate}
  static const name = 'LaunchPage';

  /// {@macro LaunchPage}
  const LaunchPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Placeholder(
      child: Text(
        'this is the launch page',
      ),
    );
  }
}
