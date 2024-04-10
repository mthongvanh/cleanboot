import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// {@template ExpandingDraggableScrollable}
/// [DraggableScrollableSheet] widget that slides up until the top is reached before
/// scrolling its child content
///
/// Taken from the flutter documentation [DraggableScrollableSheet] example.
/// [ExpandingDraggableScrollable.initialChildSize] is used in [initState] but
/// after that, the [DraggableScrollableSheet]'s size derives from a private [_sheetPosition]
/// variable
///
/// ```dart
/// Example:
/// Future<void> showSearchFilterOptions(final BuildContext context) async {
///   final result = await showModalBottomSheet<Map<String, Object>?>(
///     context: context,
///     useRootNavigator: true,
///     isScrollControlled: true,
///     clipBehavior: Clip.hardEdge,
///     backgroundColor:
///       Theme.of(context).colorScheme.background.withOpacity(0.0),
///     builder: (final ctx) => ExpandingDraggableScrollable(
///       snap: true,
///       initialChildSize: 0.85,
///       snapSizes: const [
///         0.25,
///         0.85,
///       ],
///       builder: (final context, final scrollController) => ListView.builder(
///         itemCount: 25,
///         controller: scrollController,
///         itemBuilder: (final ctx, final idx) => ListTile(
///           title: Text('$idx'),
///         ),
///       ),
///     ),
///   );
///   debugPrint('$result');
/// }
/// ```
/// {@endtemplate}
class ExpandingDraggableScrollable extends DraggableScrollableSheet {
  /// {@macro ExpandingDraggableScrollable}
  const ExpandingDraggableScrollable({
    required super.builder,
    super.initialChildSize,
    super.maxChildSize,
    super.minChildSize,
    super.controller,
    super.expand,
    super.shouldCloseOnMinExtent,
    super.snap,
    super.snapSizes,
    super.snapAnimationDuration,
    super.key,
  });

  @override
  State<ExpandingDraggableScrollable> createState() =>
      _ExpandingDraggableScrollableState();
}

class _ExpandingDraggableScrollableState
    extends State<ExpandingDraggableScrollable> {
  double _sheetPosition = 0.5;
  final double _dragSensitivity = 600;

  Widget? child;

  @override
  void initState() {
    _sheetPosition = widget.initialChildSize;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: _sheetPosition,
      maxChildSize: widget.maxChildSize,
      minChildSize: widget.minChildSize,
      controller: widget.controller,
      expand: widget.expand,
      shouldCloseOnMinExtent: widget.shouldCloseOnMinExtent,
      snap: widget.snap,
      snapSizes: widget.snapSizes,
      snapAnimationDuration: widget.snapAnimationDuration,
      builder: (
        final BuildContext context,
        final ScrollController scrollController,
      ) {
        child ??= widget.builder(context, scrollController);
        return Column(
          children: <Widget>[
            _Grabber(
              onVerticalDragUpdate: (final DragUpdateDetails details) {
                setState(() {
                  _sheetPosition -= details.delta.dy / _dragSensitivity;
                  if (_sheetPosition < 0.25) {
                    _sheetPosition = 0.25;
                  }
                  if (_sheetPosition > 1.0) {
                    _sheetPosition = 1.0;
                  }
                });
              },
              isOnDesktopAndWeb: _isOnDesktopAndWeb,
            ),
            Flexible(
              child: child ?? const SizedBox(),
            ),
          ],
        );
      },
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}

/// A draggable widget that accepts vertical drag gestures
/// and this is only visible on desktop and web platforms.
class _Grabber extends StatelessWidget {
  const _Grabber({
    super.key,
    required this.onVerticalDragUpdate,
    required this.isOnDesktopAndWeb,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(final BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        color: colorScheme.onSurface,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
