import 'package:flutter/material.dart';

/// {@template ElevatedNavigationBar}
/// Navigation Bar with a drop shadow
///
/// [NavigationBar] is wrapped in a [MediaQuery.removePadding] widget to remove
/// any padding that may have automatically been added, such as in a [Scaffold]
///
/// ```
/// Example
/// Scaffold _buildScaffold() => Scaffold(
///       body: Padding(
///         padding: EdgeInsets.all($styles.insets.sm),
///         child: DecoratedBox(
///           decoration: BoxDecoration(
///             color: Theme.of(context).colorScheme.surface,
///           ),
///           child: widget.child,
///         ),
///       ),
///       bottomNavigationBar: ElevatedNavigationBar(
///         destinations: viewModel.destinations
///             .map((final DestinationItem e) => e.toNavigationDestination())
///             .toList(),
///         selectedIndex: controller.getIndexOfSelectedItem(context),
///         insets: EdgeInsets.all($styles.insets.md),
///         borderRadius: $styles.corners.md,
///         onSelect: (final index) {
///           controller
///             ..updateSelectedIndex(
///               index,
///               context: context,
///             )
///             ..navigate(context);
///         },
///       ),
///     );
/// ```
/// {@endtemplate}
class ElevatedNavigationBar extends StatelessWidget {
  /// {@macro ElevatedNavigationBar}
  const ElevatedNavigationBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onSelect,
    this.backgroundColor,
    this.insets,
    this.shadow,
    this.borderRadius,
    this.removeTopPadding = true,
    this.removeBottomPadding = true,
    this.labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected,
  });

  /// Destinations displayed in the [NavigationBar]
  final List<NavigationDestination> destinations;

  /// Index of the selected [NavigationDestination]
  final int selectedIndex;

  /// Callback when a [NavigationDestination] is tapped
  final void Function(int index) onSelect;

  /// [NavigationBar.backgroundColor]
  final Color? backgroundColor;

  /// Margin inset for the [NavigationBar]'s container that contains the drop shadow
  final EdgeInsets? insets;

  /// [NavigationBar]'s drop shadow
  final BoxShadow? shadow;

  /// Corner radius for the [NavigationBar]
  final double? borderRadius;

  /// Whether to remove the top padding in the [MediaQuery.removePadding] widget
  ///
  /// Defaults to true, removing [SafeArea]'s padding which is automatically added
  final bool removeTopPadding;

  /// Whether to remove the bottom padding in the [MediaQuery.removePadding] widget
  ///
  /// Defaults to true removing [SafeArea]'s padding which is automatically added
  final bool removeBottomPadding;

  /// Defines how the [NavigationBar] destination's label appears
  final NavigationDestinationLabelBehavior labelBehavior;

  BoxShadow get _defaultBoxShadow => BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 8.0,
    spreadRadius: 5.0,
  );

  @override
  Widget build(final BuildContext context) {
    return destinations.isNotEmpty
        ? MediaQuery.removePadding(
            removeTop: removeTopPadding,
            removeBottom: removeBottomPadding,
            context: context,
            child: Container(
              margin: insets ?? const EdgeInsets.all(24.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  boxShadow: [
                    shadow ?? _defaultBoxShadow,
                  ],
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
                ),
                child: NavigationBar(
                  backgroundColor: backgroundColor,
                  selectedIndex: selectedIndex,
                  destinations: destinations,
                  labelBehavior: labelBehavior,
                  onDestinationSelected: onSelect,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
