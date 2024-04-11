import 'package:flutter/material.dart';

/// {@template FilterInputWidget}
/// FilterInput wrapper with default customized appearance
/// {@endtemplate}
class FilterInputWidget extends StatelessWidget {
  /// Filter title
  final String itemDisplayText;

  /// Filter title
  final TextStyle? itemDisplayStyle;

  /// Whether the item should show a selected state
  final bool selected;

  /// Callback when the item is selected
  final void Function({required bool selected}) onSelect;

  /// {@macro FilterInputWidget}
  const FilterInputWidget({
    super.key,
    required this.itemDisplayText,
    this.itemDisplayStyle,
    required this.onSelect,
    required this.selected,
  });

  @override
  Widget build(final BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
      child: FilterChip(
        selected: selected,
        showCheckmark: true,
        checkmarkColor: Theme.of(context).colorScheme.surface,
        label: Text(
          itemDisplayText,
          style: itemDisplayStyle,
        ),
        labelStyle: TextStyle(
          color: MaterialStateColor.resolveWith((final states) {
            if (states.contains(MaterialState.selected)) {
              return Theme.of(context).colorScheme.surface;
            } else {
              return Theme.of(context).colorScheme.onSurface.withOpacity(0.75);
            }
          }),
        ),
        selectedColor: Theme.of(context).colorScheme.onSurface,
        backgroundColor:
            Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(color: Colors.transparent),
        ),
        onSelected: (final selected) => onSelect(selected: selected),
      ),
    );
  }
}
