import 'package:flutter/material.dart';

/// {@template TitledListView}
/// Displays a title and accessory button in a row with a horizontal scrolling
/// [ListView]
///
/// ```dart
/// Example code
/// Widget build(final BuildContext context) {
///   final smallInset = $styles.insets.sm;
///   return TitledListView(
///     titleRowPadding: EdgeInsets.only(
///       left: smallInset,
///       top: $styles.insets.lg,
///       right: smallInset,
///     ),
///     title: title,
///     titleStyle: titleStyle,
///     subtitle: subtitle,
///     subtitleStyle: subtitleStyle,
///     accessoryText: accessoryText,
///     accessoryTextStyle: accessoryTextStyle,
///     accessoryPressed: onAccessoryTapped,
///     items: _items,
///     itemBuilder: (final BuildContext context, final int index) {
///       final image = _randomImage(_items);
///       return GestureDetector(
///         child: Padding(
///           padding: EdgeInsets.only(
///             right: smallInset,
///             bottom: smallInset,
///           ),
///           child: Image.asset(image),
///         ),
///         onTap: () => onItemSelected?.call(context, index),
///       );
///     },
///   );
/// }
/// ```
/// {@endtemplate}
class TitledListView<T> extends StatelessWidget {
  /// Prominently describes the content in the [ListView]
  final String title;

  /// Customize appearance of [title]
  final TextStyle? titleStyle;

  /// Describes the content in the [ListView]
  final String? subtitle;

  /// Customize appearance of [subtitle]
  final TextStyle? subtitleStyle;

  /// Padding around the title, subtitle, and accessory button's parent widget
  final EdgeInsets? titleRowPadding;

  /// Text displayed next to the [title] text
  final String? accessoryText;

  /// Appearance customization for text displayed next to the [title] text
  final TextStyle? accessoryTextStyle;

  /// Callback when accessory button in the title row is pressed
  final VoidCallback? accessoryPressed;

  /// List of items to display
  final List<T> items;

  /// Builds the [ListView] item's content
  final IndexedWidgetBuilder itemBuilder;

  /// Callback performed when a Paintz item is selected from the list
  final void Function(BuildContext context, int index)? onItemSelected;

  /// {@macro TitledListView}
  const TitledListView({
    super.key,
    this.titleRowPadding,
    required this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.accessoryText,
    this.accessoryTextStyle,
    this.accessoryPressed,
    required this.itemBuilder,
    required this.items,
    this.onItemSelected,
  });

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: titleRowPadding ??
              const EdgeInsets.only(
                left: 16.0,
                top: 32.0,
                right: 16.0,
              ),
          child: _buildTitle(context),
        ),
        _buildContent(
          context,
          builder: itemBuilder,
        ),
      ],
    );
  }

  Widget _buildTitle(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMainTitleRow(context),
                ],
              ),
            ),
          ],
        ),
        if (subtitle?.isNotEmpty ?? false)
          Text(
            subtitle!,
            style: subtitleStyle,
          ),
      ],
    );
  }

  Row _buildMainTitleRow(final BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: titleStyle ?? Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        _buildAccessoryButton(
          context,
          accessoryText: accessoryText,
          accessoryTextStyle: accessoryTextStyle,
          onPressed: accessoryPressed,
        ),
      ],
    );
  }

  Widget _buildAccessoryButton(
    final BuildContext context, {
    final String? accessoryText,
    final TextStyle? accessoryTextStyle,
    final VoidCallback? onPressed,
  }) {
    return (accessoryText?.isNotEmpty ?? false)
        ? TextButton(
            onPressed: onPressed,
            child: Text(
              accessoryText!,
              style: accessoryTextStyle,
            ),
          )
        : const SizedBox();
  }

  Widget _buildContent(
    final BuildContext context, {
    required final IndexedWidgetBuilder builder,
    final double aspectRatio = 1.0,
    final EdgeInsets contentListViewPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
    ),
    final Axis scrollDirection = Axis.horizontal,
  }) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        return AspectRatio(
          aspectRatio: aspectRatio,
          child: ListView.builder(
            itemCount: items.length,
            padding: contentListViewPadding,
            scrollDirection: scrollDirection,
            itemBuilder: (final ctx, final idx) {
              return GestureDetector(
                onTap: () => onItemSelected?.call(ctx, idx),
                child: itemBuilder(ctx, idx),
              );
            },
          ),
        );
      },
    );
  }
}
